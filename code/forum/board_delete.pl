#!/usr/bin/perl
#------------------------------------------------------------------------------
#    mwForum - Web-based discussion forum
#    Copyright (c) 1999-2007 Markus Wichitill
#
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#------------------------------------------------------------------------------

use strict;
use warnings;
no warnings qw(uninitialized redefine);

# Imports
use Forum::MwfMain;

#------------------------------------------------------------------------------

# Init
my ($m, $cfg, $lng, $user) = MwfMain->new(@_);
my $userId = $user->{id};

# Check if user is admin
$user->{admin} or $m->adminError();

# Get CGI parameters
my $boardId = $m->paramInt('bid');
my $sourceAuth = $m->paramInt('auth');
$boardId or $m->paramError($lng->{errBrdIdMiss});

# Check request source authentication
$sourceAuth == $user->{sourceAuth} or $m->paramError($lng->{errSrcAuth});

# Transaction
$m->dbBegin();
eval {
	# Delete admins
	$m->dbDo("
		DELETE FROM $cfg->{dbPrefix}boardAdmins WHERE boardId = $boardId");
	
	# Delete members
	$m->dbDo("
		DELETE FROM $cfg->{dbPrefix}boardMembers WHERE boardId = $boardId");

	# Delete admin groups
	$m->dbDo("
		DELETE FROM $cfg->{dbPrefix}boardAdminGroups WHERE boardId = $boardId");
	
	# Delete member groups
	$m->dbDo("
		DELETE FROM $cfg->{dbPrefix}boardMemberGroups WHERE boardId = $boardId");
	
	# Delete subscriptions
	$m->dbDo("
		DELETE FROM $cfg->{dbPrefix}boardSubscriptions WHERE boardId = $boardId");
	
	# Delete hidden-flags
	$m->dbDo("
		DELETE FROM $cfg->{dbPrefix}boardHiddenFlags WHERE boardId = $boardId");

	# Delete topics
	my $topics = $m->fetchAllArray("
		SELECT id FROM $cfg->{dbPrefix}topics WHERE boardId = $boardId");
	$m->deleteTopic($_->[0]) for @$topics;
	
	# Delete board
	$m->dbDo("
		DELETE FROM $cfg->{dbPrefix}boards WHERE id = $boardId");
};
$@ ? $m->dbRollback() : $m->dbCommit();

# Log action
$m->logAction(1, 'board', 'delete', $userId, $boardId);

# Redirect
$m->redirect('board_admin');
