DROP DATABASE if exists mwforum;
CREATE DATABASE mwforum;
USE mwforum;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `attachments` (
  `id` int(11) NOT NULL auto_increment,
  `postId` int(11) NOT NULL default '0',
  `webImage` tinyint(4) NOT NULL default '0',
  `fileName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `attachments_postId` (`postId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `boardAdminGroups` (
  `groupId` int(11) NOT NULL default '0',
  `boardId` int(11) NOT NULL default '0',
  PRIMARY KEY  (`groupId`,`boardId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `boardAdmins` (
  `userId` int(11) NOT NULL default '0',
  `boardId` int(11) NOT NULL default '0',
  PRIMARY KEY  (`userId`,`boardId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `boardHiddenFlags` (
  `userId` int(11) NOT NULL default '0',
  `boardId` int(11) NOT NULL default '0',
  PRIMARY KEY  (`userId`,`boardId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `boardMemberGroups` (
  `groupId` int(11) NOT NULL default '0',
  `boardId` int(11) NOT NULL default '0',
  PRIMARY KEY  (`groupId`,`boardId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `boardMembers` (
  `userId` int(11) NOT NULL default '0',
  `boardId` int(11) NOT NULL default '0',
  PRIMARY KEY  (`userId`,`boardId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `boards` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `categoryId` int(11) NOT NULL default '0',
  `pos` smallint(6) NOT NULL default '0',
  `expiration` smallint(6) NOT NULL default '0',
  `locking` smallint(6) NOT NULL default '0',
  `approve` tinyint(4) NOT NULL default '0',
  `private` tinyint(4) NOT NULL default '0',
  `list` tinyint(4) NOT NULL default '0',
  `anonymous` tinyint(4) NOT NULL default '0',
  `unregistered` tinyint(4) NOT NULL default '0',
  `announce` tinyint(4) NOT NULL default '0',
  `flat` tinyint(4) NOT NULL default '0',
  `attach` tinyint(4) NOT NULL default '0',
  `shortDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `longDesc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `postNum` int(11) NOT NULL default '0',
  `lastPostTime` int(11) NOT NULL default '0',
  `boardkey` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `start_date` date default '0000-00-00',
  `end_date` date default '9999-12-31',
  PRIMARY KEY  (`id`),
  KEY `boardkey` (`boardkey`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `boardSubscriptions` (
  `userId` int(11) NOT NULL default '0',
  `boardId` int(11) NOT NULL default '0',
  PRIMARY KEY  (`userId`,`boardId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `pos` smallint(6) NOT NULL default '0',
  `categorykey` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `chat` (
  `id` int(11) NOT NULL auto_increment,
  `userId` int(11) NOT NULL default '0',
  `postTime` int(11) NOT NULL default '0',
  `body` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `config` (
  `name` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parse` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
INSERT INTO `config` VALUES ('forumName','',''),('boardJumpList','1',''),('styles','Default=default\nDefault2=default2\n','hash'),('styleSnippets','','hash'),('showOnlUsers','2',''),('showNewUsers','2',''),('showBdayUsers','0',''),('showNewBlgTpcs','1',''),('allowTopicTags','1',''),('tagButtons','2',''),('showPostIp','0',''),('topicHits','1',''),('sigStart','</div>\n<div class=\'ccl sig\'>\n',''),('anonName','anonymous',''),('userTitles','','array'),('userRanks','','array'),('languages','English=MwfEnglish\nGerman=MwfGerman\n','hash'),('languageCodes','de=German\nen=English\n','hash'),('tags','','hash'),('reservedNames','','array'),('hostnameBlocks','','array'),('ipBlocks','','array'),('censorWords','','array'),('userList','2',''),('policyTitle','Forum Terms of Service',''),('policy','policy stuff blah blah',''),('logPlg','','array'),('lastUpdate','1185911052',''),('boardPageDesc','1',''),('avatars','1',''),('avatarUpload','1',''),('avatarGallery','1',''),('avatarResize','0',''),('attachUrlPath','',''),('attachments','1',''),('attachImg','1',''),('attachImgThb','1',''),('attachList','3',''),('subscriptions','1',''),('authenPlg','login=\nrequest=MwfPlgAuthen::authenRequestHttp\n','hash'),('authzPlg','attach=\ndeletePost=\neditPost=\nnewPost=\nnewTopic=\nregUser=\nuserOpt=\nviewBoard=MwfPlgAuthz::viewBoard\n','hash'),('includePlg','bottom=MwfPlgInclude::bottom\nhtmlHeader=\nhttpHeader=\nmiddle=MwfPlgInclude::middle\ntop=MwfPlgInclude::top\n','hash'),('hideCopyright','1',''),('forumEmail','',''),('smtpServer','',''),('rssLink','1',''),('logLevel','0',''),('debug','0',''),('homeUrl','',''),('chat','0',''),('homeTitle','',''),('maxTopicsPP','50',''),('maxPostsPP','20',''),('scriptUrlPath','',''),('maxListUsers','10',''),('blogs','1',''),('advForumOpt','1',''),('noEmailReq','0',''),('buttonIcons','1',''),('microsummary','1',''),('showAdvOpt','0',''),('showSearchBody','0',''),('styleOptions','Default=\nDefault2=buttonIcons=\"1\" excludeUA=\"MSIE (?:4|5|6)\"\n','hash'),('adminEmail','tusk@tufts.edu',''),('msgNotify','1',''),('style','Default',''),('avatarMaxSize','100000',''),('avatarWidth','100',''),('avatarHeight','100',''),('topicTags','attachment=attach.png Attachment\nmoney=money.png Deals\nnews=newspaper.png News\npicture=photo.png Picture\nquestion=help.png Question\nworddoc=page_word.png WordDoc\n','hash'),('mailer','SMTP',''),('forumStyle','tusk.css','');

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `groupMembers` (
  `userId` int(11) NOT NULL default '0',
  `groupId` int(11) NOT NULL default '0',
  PRIMARY KEY  (`userId`,`groupId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `log` (
  `level` tinyint(4) NOT NULL default '0',
  `entity` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `action` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `userId` int(11) NOT NULL default '0',
  `boardId` int(11) NOT NULL default '0',
  `topicId` int(11) NOT NULL default '0',
  `postId` int(11) NOT NULL default '0',
  `extraId` int(11) NOT NULL default '0',
  `logTime` int(11) NOT NULL default '0',
  `ip` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `logStrings` (
  `id` int(11) NOT NULL auto_increment,
  `string` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL auto_increment,
  `senderId` int(11) NOT NULL default '0',
  `receiverId` int(11) NOT NULL default '0',
  `sendTime` int(11) NOT NULL default '0',
  `hasRead` tinyint(4) NOT NULL default '0',
  `inbox` tinyint(4) NOT NULL default '0',
  `sentbox` tinyint(4) NOT NULL default '0',
  `subject` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `body` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `messages_senderId` (`senderId`),
  KEY `messages_receiverId` (`receiverId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `notes` (
  `id` int(11) NOT NULL auto_increment,
  `userId` int(11) NOT NULL default '0',
  `sendTime` int(11) NOT NULL default '0',
  `body` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `notes_userId` (`userId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `permissions` (
  `id` int(11) NOT NULL auto_increment,
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `boardId` int(11) default NULL,
  `permissions` enum('User','Moderator','Banned') default 'User',
  PRIMARY KEY  (`id`),
  KEY `user_name_permissions` (`userName`,`permissions`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `pollOptions` (
  `id` int(11) NOT NULL auto_increment,
  `pollId` int(11) NOT NULL default '0',
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `votes` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `pollOptions_pollId` (`pollId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `polls` (
  `id` int(11) NOT NULL auto_increment,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `locked` tinyint(4) NOT NULL default '0',
  `multi` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `pollVotes` (
  `pollId` int(11) NOT NULL default '0',
  `userId` int(11) NOT NULL default '0',
  `optionId` int(11) NOT NULL default '0',
  PRIMARY KEY  (`pollId`,`userId`,`optionId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `postReports` (
  `userId` int(11) NOT NULL default '0',
  `postId` int(11) NOT NULL default '0',
  `reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY  (`userId`,`postId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL auto_increment,
  `userId` int(11) NOT NULL default '0',
  `userNameBak` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `boardId` int(11) NOT NULL default '0',
  `topicId` int(11) NOT NULL default '0',
  `parentId` int(11) NOT NULL default '0',
  `approved` tinyint(4) NOT NULL default '0',
  `ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `postTime` int(11) NOT NULL default '0',
  `editTime` int(11) NOT NULL default '0',
  `body` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `posts_userId` (`userId`),
  KEY `posts_topicId` (`topicId`),
  KEY `posts_parentId` (`parentId`),
  KEY `posts_postTime` (`postTime`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `postTodos` (
  `userId` int(11) NOT NULL default '0',
  `postId` int(11) NOT NULL default '0',
  PRIMARY KEY  (`userId`,`postId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `sessions` (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `userId` int(11) NOT NULL default '0',
  `lastOnTime` int(11) NOT NULL default '0',
  `ip` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tickets` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `userId` int(11) NOT NULL default '0',
  `issueTime` int(11) NOT NULL default '0',
  `type` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `topicReadTimes` (
  `userId` int(11) NOT NULL default '0',
  `topicId` int(11) NOT NULL default '0',
  `lastReadTime` int(11) NOT NULL default '0',
  PRIMARY KEY  (`userId`,`topicId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `topics` (
  `id` int(11) NOT NULL auto_increment,
  `subject` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tag` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `boardId` int(11) NOT NULL default '0',
  `basePostId` int(11) NOT NULL default '0',
  `pollId` int(11) NOT NULL default '0',
  `locked` tinyint(4) NOT NULL default '0',
  `sticky` tinyint(4) NOT NULL default '0',
  `hitNum` int(11) NOT NULL default '0',
  `postNum` int(11) NOT NULL default '0',
  `lastPostTime` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `topics_lastPostTime` (`lastPostTime`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `topicSubscriptions` (
  `userId` int(11) NOT NULL default '0',
  `topicId` int(11) NOT NULL default '0',
  PRIMARY KEY  (`userId`,`topicId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `userBans` (
  `userId` int(11) NOT NULL default '0',
  `banTime` int(11) NOT NULL default '0',
  `duration` smallint(6) NOT NULL default '0',
  `reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `intReason` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY  (`userId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `userIgnores` (
  `userId` int(11) NOT NULL default '0',
  `ignoredId` int(11) NOT NULL default '0',
  PRIMARY KEY  (`userId`,`ignoredId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `realName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `salt` int(11) NOT NULL default '0',
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `admin` tinyint(4) NOT NULL default '0',
  `hideEmail` tinyint(4) NOT NULL default '0',
  `dontEmail` tinyint(4) NOT NULL default '0',
  `notify` tinyint(4) NOT NULL default '0',
  `msgNotify` tinyint(4) NOT NULL default '0',
  `manOldMark` tinyint(4) NOT NULL default '0',
  `tempLogin` tinyint(4) NOT NULL default '0',
  `secureLogin` tinyint(4) NOT NULL default '0',
  `privacy` tinyint(4) NOT NULL default '0',
  `homepage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `occupation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `hobbies` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `icq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `signature` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `extra1` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `extra2` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `extra3` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birthyear` smallint(6) NOT NULL default '0',
  `birthday` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `timezone` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `language` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `style` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `fontFace` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `fontSize` tinyint(4) NOT NULL default '0',
  `boardDescs` tinyint(4) NOT NULL default '0',
  `showDeco` tinyint(4) NOT NULL default '0',
  `showAvatars` tinyint(4) NOT NULL default '0',
  `showImages` tinyint(4) NOT NULL default '0',
  `showSigs` tinyint(4) NOT NULL default '0',
  `collapse` tinyint(4) NOT NULL default '0',
  `indent` tinyint(4) NOT NULL default '0',
  `topicsPP` smallint(6) NOT NULL default '0',
  `postsPP` smallint(6) NOT NULL default '0',
  `regTime` int(11) NOT NULL default '0',
  `lastOnTime` int(11) NOT NULL default '0',
  `prevOnTime` int(11) NOT NULL default '0',
  `fakeReadTime` int(11) NOT NULL default '0',
  `lastTopicId` int(11) NOT NULL default '0',
  `lastTopicTime` int(11) NOT NULL default '0',
  `chatReadTime` int(11) NOT NULL default '0',
  `lastIp` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `userAgent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `postNum` int(11) NOT NULL default '0',
  `bounceNum` int(11) NOT NULL default '0',
  `bounceAuth` int(11) NOT NULL default '0',
  `sourceAuth` int(11) NOT NULL default '0',
  `gpgKeyId` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `gpgCompat` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `users_userName` (`userName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `variables` (
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `userId` int(11) NOT NULL default '0',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  PRIMARY KEY  (`name`,`userId`),
  KEY `userId_value` (`userId`,`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

INSERT INTO variables (name, value) VALUES ('version', '2.11.2');

DROP DATABASE if exists fts;
CREATE DATABASE fts;
USE fts;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `fts_eval` (
  `param` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL default '',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  PRIMARY KEY  (`param`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
INSERT INTO `fts_eval` VALUES ('protocol','40'),('num_of_docs','0'),('frontend','string'),('backend','phrase'),('table','fts_eval'),('index_splitter','/([a-zA-Z-\']{2,$word_length}\\*?)/g'),('word_id_table','fts_eval_words'),('count_bits','32'),('search_splitter','/([a-zA-Z-\']{2,$word_length}\\*?)/g'),('data_table','fts_eval_data'),('name_length','255'),('position_bits','32'),('blob_direct_fetc','20'),('doc_id_table','fts_eval_docid'),('filter','map { lc $_ }'),('doc_id_bits','32'),('init_env',''),('word_length','30'),('stoplist','hsdb'),('word_id_bits','32'),('max_doc_id','1098369');

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `fts_eval_data` (
  `word_id` int(10) unsigned NOT NULL default '0',
  `doc_id` int(10) unsigned NOT NULL default '0',
  `idx` longblob NOT NULL,
  KEY `word_id` (`word_id`),
  KEY `doc_id` (`doc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `fts_eval_docid` (
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL default '',
  `id` int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `fts_eval_words` (
  `word` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL default '',
  `id` int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `fts_non_user` (
  `param` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL default '',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  PRIMARY KEY  (`param`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
INSERT INTO `fts_non_user` VALUES ('word_id_bits','16'),('count_bits','8'),('stemmer',NULL),('protocol','40'),('search_splitter','/([a-zA-Z_0-9]{2,$word_length}\\*?)/g'),('doc_id_bits','16'),('frontend','none'),('position_bits','32'),('filter','map { lc $_ }'),('stoplist','hsdb'),('word_length','30'),('backend','phrase'),('index_splitter','/(\\w{2,$word_length})/g'),('word_id_table','fts_non_user_words'),('blob_direct_fetc','20'),('table','fts_non_user'),('init_env','use locale'),('num_of_docs','0'),('name_length','255'),('data_table','fts_non_user_data'),('max_doc_id','92');

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `fts_non_user_data` (
  `word_id` smallint(5) unsigned NOT NULL default '0',
  `doc_id` smallint(5) unsigned NOT NULL default '0',
  `idx` longblob NOT NULL,
  KEY `word_id` (`word_id`),
  KEY `doc_id` (`doc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `fts_non_user_words` (
  `word` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL default '',
  `id` smallint(5) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `fts_objective` (
  `param` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL default '',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  PRIMARY KEY  (`param`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
INSERT INTO `fts_objective` VALUES ('word_id_bits','16'),('count_bits','8'),('stemmer',NULL),('protocol','40'),('search_splitter','/([a-zA-Z_0-9]{2,$word_length}\\*?)/g'),('doc_id_bits','16'),('frontend','none'),('position_bits','32'),('filter','map { lc $_ }'),('stoplist','hsdb'),('word_length','30'),('backend','phrase'),('index_splitter','/(\\w{2,$word_length})/g'),('word_id_table','fts_objective_words'),('blob_direct_fetc','20'),('table','fts_objective'),('init_env','use locale'),('num_of_docs','0'),('name_length','255'),('data_table','fts_objective_data'),('max_doc_id','10674');

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `fts_objective_data` (
  `word_id` smallint(5) unsigned NOT NULL default '0',
  `doc_id` smallint(5) unsigned NOT NULL default '0',
  `idx` longblob NOT NULL,
  KEY `word_id` (`word_id`),
  KEY `doc_id` (`doc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `fts_objective_words` (
  `word` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL default '',
  `id` smallint(5) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `fts_user` (
  `param` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL default '',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  PRIMARY KEY  (`param`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
INSERT INTO `fts_user` VALUES ('word_id_bits','32'),('count_bits','32'),('protocol','40'),('search_splitter','/([a-zA-Z_0-9]{2,$word_length}\\*?)/g'),('doc_id_bits','32'),('frontend','string'),('position_bits','32'),('filter','map { lc $_ }'),('stoplist','hsdb'),('word_length','30'),('backend','phrase'),('index_splitter','/(\\w{2,$word_length})/g'),('word_id_table','fts_user_words'),('blob_direct_fetc','20'),('doc_id_table','fts_user_docid'),('table','fts_user'),('init_env','use locale'),('num_of_docs','0'),('name_length','255'),('data_table','fts_user_data'),('max_doc_id','25018');

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `fts_user_data` (
  `word_id` int(10) unsigned NOT NULL default '0',
  `doc_id` int(10) unsigned NOT NULL default '0',
  `idx` longblob NOT NULL,
  KEY `word_id` (`word_id`),
  KEY `doc_id` (`doc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `fts_user_docid` (
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL default '',
  `id` int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `fts_user_words` (
  `word` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL default '',
  `id` int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `hsdb_stoplist` (
  `word` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  PRIMARY KEY  (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
INSERT INTO `hsdb_stoplist` VALUES ('a'),('about'),('after'),('all'),('also'),('an'),('and'),('any'),('are'),('as'),('at'),('be'),('because'),('been'),('but'),('by'),('can'),('co'),('corp'),('could'),('for'),('from'),('had'),('has'),('have'),('he'),('her'),('his'),('if'),('in'),('inc'),('into'),('is'),('it'),('its'),('last'),('more'),('most'),('mr'),('mrs'),('ms'),('mz'),('no'),('not'),('of'),('on'),('one'),('only'),('or'),('other'),('out'),('over'),('s'),('says'),('she'),('so'),('some'),('such'),('than'),('that'),('the'),('their'),('there'),('they'),('this'),('to'),('up'),('was'),('we'),('were'),('when'),('which'),('who'),('will'),('with'),('would');


DROP DATABASE if exists hsdb4;
CREATE DATABASE hsdb4;
USE hsdb4;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `content` (
  `content_id` int(10) unsigned NOT NULL auto_increment,
  `type` enum('Document','Audio','Video','Flashpix','Collection','Figure','Slide','Shockwave','URL','PDF','Question','Multidocument','Quiz','DownloadableFile','Student Notes','Reuse','External','TUSKdoc') NOT NULL default 'Document',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `course_id` int(10) unsigned NOT NULL default '0',
  `school` enum('Default') default NULL,
  `system` set('Cardiovascular','Digestive','Endocrine','Hemic','Immune','Musculoskeletal','Nervous','Reproductive','Respiratory','Sense Organs','Skin','Urinary Tract') NOT NULL default '',
  `copyright` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default 'Tufts University',
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `body` mediumtext CHARACTER SET utf8,
  `hscml_body` mediumtext CHARACTER SET utf8,
  `style` enum('Medical','Veterinary','Dental','NEMC','Sackler','hsdb4-style','hscml','Liver','minimal') default 'hsdb4-style',
  `x_data_id` int(10) unsigned default NULL,
  `x_small_data_id` int(10) unsigned default NULL,
  `x_thumbnail_id` int(10) unsigned default NULL,
  `x_orig_data_id` int(10) unsigned default NULL,
  `x_xlg_data_id` int(10) unsigned default NULL,
  `x_lg_data_id` int(10) unsigned default NULL,
  `x_med_data_id` int(10) unsigned default NULL,
  `x_sm_data_id` int(10) unsigned default NULL,
  `x_thumb_data_id` int(10) unsigned default NULL,
  `x_icon_data_id` int(10) unsigned default NULL,
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `created` datetime default NULL,
  `read_access` enum('Authors','Course Faculty','Course Users','HSDB Users','All Users','Guests','None') NOT NULL default 'HSDB Users',
  `write_access` enum('None','First author','All authors','Course authors') default NULL,
  `checked_out_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `check_out_time` datetime default NULL,
  `conversion_status` int(1) default NULL,
  `display` int(1) default '1',
  `reuse_content_id` int(10) unsigned NOT NULL default '0',
  `start_date` date default NULL,
  `end_date` date default NULL,
  PRIMARY KEY  (`content_id`),
  KEY `course_id` (`course_id`),
  KEY `system` (`system`),
  KEY `title` (`title`),
  KEY `type` (`type`),
  KEY `modified` (`modified`),
  KEY `start_date` (`start_date`),
  KEY `end_date` (`end_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `content_history` (
  `content_history_id` int(10) unsigned NOT NULL auto_increment,
  `content_id` int(10) unsigned NOT NULL default '0',
  `type` enum('Document','Audio','Video','Flashpix','Collection','Figure','Slide','Shockwave','URL','PDF','Question','Multidocument','Quiz','DownloadableFile','Student Notes','Reuse','External','TUSKdoc') NOT NULL default 'Document',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `course_id` int(10) unsigned NOT NULL default '0',
  `school` enum('Default') NOT NULL,
  `system` set('Cardiovascular','Digestive','Endocrine','Hemic','Immune','Musculoskeletal','Nervous','Reproductive','Respiratory','Sense Organs','Skin','Urinary Tract') NOT NULL default '',
  `copyright` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `body` mediumtext CHARACTER SET utf8,
  `hscml_body` mediumtext CHARACTER SET utf8,
  `style` enum('Medical','Veterinary','Dental','NEMC','Sackler','hsdb4-style','hscml','Liver','minimal') default NULL,
  `data_id` int(10) unsigned default NULL,
  `small_data_id` int(10) unsigned default NULL,
  `thumbnail_id` int(10) unsigned default NULL,
  `orig_data_id` int(10) default NULL,
  `xlg_data_id` int(10) default NULL,
  `lg_data_id` int(10) unsigned default NULL,
  `med_data_id` int(10) unsigned default NULL,
  `sm_data_id` int(10) unsigned default NULL,
  `thumb_data_id` int(10) unsigned default NULL,
  `icon_data_id` int(10) unsigned default NULL,
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `created` datetime default NULL,
  `read_access` enum('None','Authors','Course Faculty','Course Users','HSDB Users','Guests') default NULL,
  `write_access` enum('None','First author','All authors','Course authors') default NULL,
  `checked_out_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `check_out_time` datetime default NULL,
  `conversion_status` int(1) default NULL,
  `display` int(1) default '1',
  `reuse_content_id` int(10) unsigned NOT NULL default '0',
  `modify_note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `start_date` date default NULL,
  `end_date` date default NULL,
  PRIMARY KEY  (`content_history_id`),
  KEY `content_id` (`content_id`,`modified`),
  KEY `course_id` (`course_id`),
  KEY `system` (`system`),
  KEY `title` (`title`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_content_content` (
  `parent_content_id` int(10) unsigned NOT NULL default '0',
  `child_content_id` int(10) unsigned NOT NULL default '0',
  `sort_order` smallint(6) unsigned NOT NULL default '65535',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`parent_content_id`,`child_content_id`),
  KEY `child_content_id` (`child_content_id`),
  KEY `parent_content_id` (`parent_content_id`,`sort_order`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_content_non_user` (
  `parent_content_id` int(10) unsigned NOT NULL default '0',
  `child_non_user_id` int(10) unsigned NOT NULL default '0',
  `roles` set('Author','Contact-Person','Director','Editor','Unknown') NOT NULL default '',
  `sort_order` smallint(6) unsigned NOT NULL default '65535',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`parent_content_id`,`child_non_user_id`,`roles`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_content_objective` (
  `parent_content_id` int(10) unsigned NOT NULL default '0',
  `child_objective_id` int(10) unsigned NOT NULL default '0',
  `sort_order` smallint(6) unsigned NOT NULL default '65535',
  `relationship` enum('Prerequisite','Goal') default NULL,
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`parent_content_id`,`child_objective_id`),
  KEY `child_objective_id` (`child_objective_id`),
  KEY `parent_content_id` (`parent_content_id`,`sort_order`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_content_personal_content` (
  `parent_content_id` int(10) unsigned NOT NULL default '0',
  `child_personal_content_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`parent_content_id`,`child_personal_content_id`),
  KEY `child_personal_content_id` (`child_personal_content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_content_user` (
  `parent_content_id` int(10) unsigned NOT NULL default '0',
  `child_user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `roles` set('Director','Author','Editor','Contact-Person','Student-Author','Student-Editor','Unknown') NOT NULL default 'Unknown',
  `sort_order` smallint(6) unsigned NOT NULL default '65535',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`parent_content_id`,`child_user_id`,`roles`),
  KEY `child_user_id` (`child_user_id`),
  KEY `parent_content_id` (`parent_content_id`,`sort_order`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_course_user` (
  `parent_course_id` int(10) unsigned NOT NULL default '0',
  `child_user_id` char(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `sort_order` smallint(6) unsigned NOT NULL default '65535',
  `roles` set('Director','Editor','Author','Lecturer','Instructor','Lab Instructor','Librarian','MERC Representative') default NULL,
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`parent_course_id`,`child_user_id`),
  KEY `child_user_id` (`child_user_id`),
  KEY `parent_course_id` (`parent_course_id`,`sort_order`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_forum_user` (
  `parent_forum_id` int(10) default NULL,
  `child_user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `roles` set('Admin','User') default 'User',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_personal_content_content` (
  `parent_personal_content_id` int(10) unsigned NOT NULL default '0',
  `child_content_id` int(10) unsigned NOT NULL default '0',
  `sort_order` smallint(6) unsigned NOT NULL default '65535',
  PRIMARY KEY  (`parent_personal_content_id`,`child_content_id`),
  KEY `child_content_id` (`child_content_id`),
  KEY `parent_personal_content_id` (`parent_personal_content_id`,`sort_order`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_personal_content_personal_content` (
  `parent_personal_content_id` int(10) unsigned NOT NULL default '0',
  `child_personal_content_id` int(10) unsigned NOT NULL default '0',
  `sort_order` smallint(6) unsigned NOT NULL default '65535',
  PRIMARY KEY  (`parent_personal_content_id`,`child_personal_content_id`),
  KEY `child_personal_content_id` (`child_personal_content_id`),
  KEY `parent_personal_content_id` (`parent_personal_content_id`,`sort_order`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_user_group_user` (
  `parent_user_group_id` int(10) unsigned NOT NULL default '0',
  `child_user_id` char(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`parent_user_group_id`,`child_user_id`),
  KEY `child_user_id` (`child_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_user_personal_content` (
  `parent_user_id` char(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `child_personal_content_id` int(10) unsigned NOT NULL default '0',
  `sort_order` smallint(6) unsigned NOT NULL default '65535',
  PRIMARY KEY  (`parent_user_id`,`child_personal_content_id`),
  KEY `parent_user_id` (`parent_user_id`,`sort_order`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `log_item` (
  `log_item_id` int(10) unsigned NOT NULL auto_increment,
  `user_id` char(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `hit_date` datetime default NULL,
  `log_item_type_id` int(10) NOT NULL default '0',
  `course_id` int(10) unsigned default NULL,
  `content_id` int(10) unsigned default NULL,
  `personal_content_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`log_item_id`),
  KEY `user_id` (`user_id`,`hit_date`),
  KEY `hit_date` (`hit_date`),
  KEY `log_item_i01` (`course_id`),
  KEY `log_item_i02` (`content_id`),
  KEY `log_item_i03` (`personal_content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `non_user` (
  `non_user_id` int(10) NOT NULL auto_increment,
  `email` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `institution` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `lastname` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `firstname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `midname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `suffix` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `degree` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `body` text CHARACTER SET utf8,
  PRIMARY KEY  (`non_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `objective` (
  `objective_id` int(10) unsigned NOT NULL auto_increment,
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `body` text CHARACTER SET utf8,
  PRIMARY KEY  (`objective_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `personal_content` (
  `personal_content_id` int(10) unsigned NOT NULL auto_increment,
  `user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `type` enum('Collection','Note','URL','Annotation','Discussion Comment','Di\nscussion Answer','Discussion Question','Discussion Suggestion','Discussion Tip','Discussion URL','Flash Card Deck') default NULL,
  `course_id` int(10) unsigned default NULL,
  `content_id` int(10) unsigned NOT NULL default '0',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `body` text CHARACTER SET utf8,
  PRIMARY KEY  (`personal_content_id`),
  KEY `user_id` (`user_id`),
  KEY `content_id` (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ppt_upload_status` (
  `ppt_upload_status_id` int(10) NOT NULL auto_increment,
  `username` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `course_id` int(10) unsigned default NULL,
  `filename` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `statustime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `copyright` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `saved_filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `school` enum('Default') NOT NULL,
  `content_id` int(10) default NULL,
  `author` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `status` enum('Uploaded','Processing','Completed','Error') default NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  PRIMARY KEY  (`ppt_upload_status_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `query` (
  `query_id` int(10) unsigned NOT NULL auto_increment,
  `user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `textkeys` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `query_text` text CHARACTER SET utf8,
  `matches` int(10) unsigned default NULL,
  PRIMARY KEY  (`query_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `recent_log_item` (
  `recent_log_item_id` int(10) unsigned NOT NULL auto_increment,
  `user_id` char(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `hit_date` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `log_item_type_id` int(10) NOT NULL default '0',
  `course_id` int(10) unsigned default NULL,
  `content_id` int(10) unsigned default NULL,
  `personal_content_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`recent_log_item_id`),
  KEY `user_id` (`user_id`,`hit_date`),
  KEY `hit_date` (`hit_date`),
  KEY `recent_log_item_i01` (`course_id`),
  KEY `recent_log_item_i02` (`content_id`),
  KEY `recent_log_item_i03` (`personal_content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `sessions` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `a_session` text CHARACTER SET utf8,
  `modified_on` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `sessions_modified` (`modified_on`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `stylesheet_type` (
  `stylesheet_type_id` int(10) unsigned NOT NULL auto_increment,
  `stylesheet_type_label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `global_stylesheet` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `format` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  PRIMARY KEY  (`stylesheet_type_id`),
  UNIQUE KEY `stylesheet_type_label` (`stylesheet_type_label`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
INSERT INTO `stylesheet_type` VALUES (1,'Eval','/Eval/eval.xsl','2002-11-01 17:50:11',NULL),(2,'EvalResults','/Eval/eval_results.xsl','2002-11-01 17:50:40',NULL);

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `teaching_site` (
  `teaching_site_id` int(10) unsigned NOT NULL auto_increment,
  `site_name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `site_city_state` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`teaching_site_id`),
  KEY `site_name` (`site_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `user` (
  `user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `source` set('internal','external') default NULL,
  `status` set('Active','Inactive','Restricted','Test') default 'Active',
  `tufts_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `sid` int(10) default NULL,
  `trunk` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `email` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `preferred_email` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `profile_status` set('UpdateInfo','ChangePassword') default NULL,
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `password_reset` datetime default NULL,
  `expires` date default NULL,
  `login` datetime default '2000-01-01 00:00:00',
  `previous_login` datetime default '2000-01-01 00:00:00',
  `lastname` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `firstname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `midname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `suffix` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `degree` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `affiliation` set('Default') default NULL,
  `gender` enum('Male','Female','Unknown') NOT NULL default 'Unknown',
  `body` text CHARACTER SET utf8,
  `loggedout_flag` int(1) unsigned default '1',
  `uid` int(11) NOT NULL,
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `lastname` (`lastname`,`firstname`),
  KEY `affiliation` (`affiliation`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `user_group` (
  `user_group_id` int(10) unsigned NOT NULL auto_increment,
  `school` enum('Medical','Veterinary','Dental','NEMC','Sackler','OGDP') NOT NULL default 'Medical',
  `label` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `schedule_flag_time` datetime default NULL,
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`user_group_id`),
  KEY `school` (`school`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `xml_cache` (
  `formatter_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `school` enum('Default') NOT NULL,
  `object_id` int(10) unsigned NOT NULL default '0',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `formatter_version` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `body` longtext CHARACTER SET utf8,
  PRIMARY KEY  (`formatter_name`,`school`,`object_id`),
  KEY `school` (`school`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;


DROP DATABASE if exists tusk;
CREATE DATABASE tusk;
USE tusk;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `assignment` (
  `assignment_id` int(10) unsigned NOT NULL auto_increment,
  `grade_event_id` int(10) unsigned NOT NULL default '0',
  `available_date` datetime default NULL,
  `due_date` datetime default NULL,
  `group_file_flag` int(1) unsigned NOT NULL default '0',
  `resubmit_flag` tinyint(3) unsigned NOT NULL default '0',
  `sort_order` smallint(6) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`assignment_id`),
  KEY `grade_event_id` (`grade_event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `assignment_history` (
  `assignment_history_id` int(10) unsigned NOT NULL auto_increment,
  `assignment_id` int(10) unsigned NOT NULL default '0',
  `grade_event_id` int(10) unsigned NOT NULL default '0',
  `available_date` datetime default NULL,
  `due_date` datetime default NULL,
  `group_file_flag` int(1) unsigned NOT NULL default '0',
  `resubmit_flag` tinyint(3) unsigned NOT NULL default '0',
  `sort_order` smallint(6) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`assignment_history_id`),
  KEY `assignment_id` (`assignment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `assignment_note` (
  `assignment_note_id` int(10) unsigned NOT NULL auto_increment,
  `type` enum('self-note','group-note','student-comment','faculty-comment') default NULL,
  `sort_order` int(1) unsigned NOT NULL default '0',
  `link_id` int(10) unsigned NOT NULL default '0',
  `link_type` enum('link_assignment_student','link_assignment_user_group') default NULL,
  `body` text CHARACTER SET utf8,
  `submit_sequence` int(1) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`assignment_note_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `assignment_note_history` (
  `assignment_note_history_id` int(10) unsigned NOT NULL auto_increment,
  `assignment_note_id` int(10) unsigned default NULL,
  `type` enum('self-note','group-note','student-comment','faculty-comment') default NULL,
  `sort_order` int(1) unsigned NOT NULL default '0',
  `link_id` int(10) unsigned NOT NULL default '0',
  `link_type` enum('link_assignment_student','link_assignment_user_group') default NULL,
  `body` text CHARACTER SET utf8,
  `submit_sequence` int(1) unsigned NOT NULL default '0',
  `history_action` enum('Insert','Update','Delete') default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`assignment_note_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `assignment_submission` (
  `assignment_submission_id` int(10) unsigned NOT NULL auto_increment,
  `link_id` int(10) unsigned NOT NULL default '0',
  `link_type` enum('link_assignment_student','link_assignment_user_group') default NULL,
  `submit_sequence` int(1) unsigned NOT NULL default '0',
  `submit_date` datetime default NULL,
  `grade` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `feedback_post_flag` enum('Y','N') default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`assignment_submission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `assignment_submission_history` (
  `assignment_submission_history_id` int(10) unsigned NOT NULL auto_increment,
  `assignment_submission_id` int(10) unsigned default NULL,
  `link_id` int(10) unsigned NOT NULL default '0',
  `link_type` enum('link_assignment_student','link_assignment_user_group') default NULL,
  `submit_sequence` int(1) unsigned NOT NULL default '0',
  `submit_date` datetime default NULL,
  `grade` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `feedback_post_flag` enum('Y','N') default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`assignment_submission_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `battery` (
  `battery_id` int(10) unsigned NOT NULL auto_increment,
  `school_id` int(11) NOT NULL default '0',
  `battery_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `battery_desc` text CHARACTER SET utf8,
  `battery_type` enum('Physical Exam','Diagnostic Studies','History') NOT NULL default 'Diagnostic Studies',
  `lab_sheet` mediumtext CHARACTER SET utf8,
  `sort_order` int(10) unsigned NOT NULL default '4294967295',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`battery_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `battery_history` (
  `battery_history_id` int(10) unsigned NOT NULL auto_increment,
  `battery_id` int(10) unsigned NOT NULL default '0',
  `school_id` int(11) NOT NULL default '0',
  `battery_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `battery_desc` text CHARACTER SET utf8,
  `battery_type` enum('Physical Exam','Diagnostic Studies','History') NOT NULL default 'Diagnostic Studies',
  `lab_sheet` mediumtext CHARACTER SET utf8,
  `sort_order` int(10) unsigned NOT NULL default '999999999',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`battery_history_id`),
  KEY `battery_history_i01` (`battery_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `case_header` (
  `case_header_id` int(10) unsigned NOT NULL auto_increment,
  `case_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `case_user_desc` text CHARACTER SET utf8,
  `case_author_desc` text CHARACTER SET utf8,
  `duration_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `duration` time default NULL,
  `case_type` enum('Self-Assessment','Test','Reviewed') NOT NULL default 'Self-Assessment',
  `patient_type_id` int(10) unsigned NOT NULL default '0',
  `navigation_type` enum('Linear','Global') NOT NULL default 'Linear',
  `publish_flag` tinyint(1) NOT NULL default '0',
  `share_case` tinyint(1) default NULL,
  `restricted_access` tinyint(1) NOT NULL default '0',
  `feedback_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `billing_total` tinyint(1) NOT NULL default '1',
  `references_section` tinyint(1) NOT NULL default '0',
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `copyright` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`case_header_id`),
  KEY `case_header_i01` (`patient_type_id`),
  KEY `case_header_i02` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `case_header_history` (
  `case_header_history_id` int(10) unsigned NOT NULL auto_increment,
  `case_header_id` int(10) unsigned NOT NULL default '0',
  `case_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `case_user_desc` text CHARACTER SET utf8,
  `case_author_desc` text CHARACTER SET utf8,
  `duration_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `duration` time default NULL,
  `case_type` enum('Self-Assessment','Test','Reviewed') NOT NULL default 'Self-Assessment',
  `patient_type_id` int(10) unsigned NOT NULL default '0',
  `navigation_type` enum('Linear','Global') NOT NULL default 'Linear',
  `publish_flag` tinyint(1) NOT NULL default '0',
  `share_case` tinyint(1) default NULL,
  `restricted_access` tinyint(1) NOT NULL default '0',
  `feedback_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `billing_total` tinyint(1) NOT NULL default '1',
  `references_section` tinyint(1) NOT NULL default '0',
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `copyright` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`case_header_history_id`),
  KEY `case_header_history_i01` (`patient_type_id`),
  KEY `case_header_history_i02` (`created_by`),
  KEY `case_header_history_i03` (`case_header_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `case_phase_option_selection` (
  `phase_option_selection_id` int(10) unsigned NOT NULL auto_increment,
  `case_report_id` int(10) unsigned NOT NULL default '0',
  `phase_id` int(10) unsigned NOT NULL default '0',
  `phase_visit_id` int(10) unsigned NOT NULL default '0',
  `phase_option_id` int(10) unsigned NOT NULL default '0',
  `short_answer_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `answer_text` text CHARACTER SET utf8,
  `option_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `correct` tinyint(1) default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`phase_option_selection_id`),
  UNIQUE KEY `case_report_id` (`case_report_id`,`phase_option_id`,`phase_visit_id`),
  KEY `phase_option_selection_i01` (`case_report_id`),
  KEY `phase_option_selection_i02` (`phase_id`),
  KEY `phase_option_selection_i03` (`phase_option_id`),
  KEY `phase_visit_id` (`phase_visit_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `case_phase_option_selection_history` (
  `phase_option_selection_history_id` int(10) unsigned NOT NULL auto_increment,
  `phase_option_selection_id` int(10) unsigned NOT NULL default '0',
  `case_report_id` int(10) unsigned NOT NULL default '0',
  `phase_id` int(10) unsigned NOT NULL default '0',
  `phase_visit_id` int(10) unsigned NOT NULL default '0',
  `phase_option_id` int(10) unsigned NOT NULL default '0',
  `short_answer_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `answer_text` text CHARACTER SET utf8,
  `option_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `correct` tinyint(1) default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`phase_option_selection_history_id`),
  KEY `phase_option_selection_history_i01` (`phase_option_selection_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `case_phase_test_exclusion` (
  `phase_test_exclusion_id` int(10) unsigned NOT NULL auto_increment,
  `phase_id` int(10) unsigned NOT NULL default '0',
  `test_id` int(10) unsigned NOT NULL default '0',
  `alternate_value` text CHARACTER SET utf8,
  `alternate_content_id` int(10) unsigned default NULL,
  `feedback` text CHARACTER SET utf8,
  `correct` tinyint(1) NOT NULL default '0',
  `priority` enum('Low','Medium','High') NOT NULL default 'Low',
  `include` tinyint(1) NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`phase_test_exclusion_id`),
  UNIQUE KEY `phase_test_exclusion_u01` (`phase_id`,`test_id`),
  KEY `phase_test_exclusion_i01` (`phase_id`),
  KEY `phase_test_exclusion_i02` (`test_id`),
  KEY `phase_test_exclusion_i03` (`alternate_content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `case_phase_test_exclusion_history` (
  `phase_test_exclusion_history_id` int(10) unsigned NOT NULL auto_increment,
  `phase_test_exclusion_id` int(10) unsigned NOT NULL default '0',
  `phase_id` int(10) unsigned NOT NULL default '0',
  `test_id` int(10) unsigned NOT NULL default '0',
  `alternate_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `alternate_content_id` int(10) unsigned default NULL,
  `feedback` text CHARACTER SET utf8,
  `correct` tinyint(1) NOT NULL default '0',
  `priority` enum('Low','Medium','High') NOT NULL default 'Low',
  `include` tinyint(1) NOT NULL default '1',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`phase_test_exclusion_history_id`),
  KEY `phase_test_exclusion_id` (`phase_test_exclusion_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `case_phase_visit` (
  `phase_visit_id` int(10) unsigned NOT NULL auto_increment,
  `case_report_id` int(10) unsigned NOT NULL default '0',
  `phase_id` int(10) unsigned NOT NULL default '0',
  `visit_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`phase_visit_id`),
  KEY `phase_visit_i01` (`phase_id`),
  KEY `phase_visit_i02` (`case_report_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `case_phase_visit_history` (
  `phase_visit_history_id` int(10) unsigned NOT NULL auto_increment,
  `phase_visit_id` int(10) unsigned NOT NULL default '0',
  `case_report_id` int(10) unsigned NOT NULL default '0',
  `phase_id` int(10) unsigned NOT NULL default '0',
  `visit_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`phase_visit_history_id`),
  KEY `phase_visit_history_i01` (`phase_visit_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `case_report` (
  `case_report_id` int(10) unsigned NOT NULL auto_increment,
  `case_id` int(10) unsigned NOT NULL default '0',
  `user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `start_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `end_date` datetime default NULL,
  `notes` text CHARACTER SET utf8,
  `preview_flag` tinyint(1) NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`case_report_id`),
  KEY `case_report_i02` (`case_id`),
  KEY `case_report_i03` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `case_report_history` (
  `case_report_history_id` int(10) unsigned NOT NULL auto_increment,
  `case_report_id` int(10) unsigned NOT NULL default '0',
  `case_id` int(10) unsigned NOT NULL default '0',
  `user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `start_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `end_date` datetime default NULL,
  `notes` text CHARACTER SET utf8,
  `preview_flag` tinyint(1) NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`case_report_history_id`),
  KEY `case_report_history_i01` (`case_report_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `case_rule` (
  `rule_id` int(10) unsigned NOT NULL auto_increment,
  `phase_id` int(10) unsigned NOT NULL,
  `rule_operator_type_id` tinyint(3) unsigned NOT NULL,
  `message` text CHARACTER SET utf8,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`rule_id`),
  KEY `phase_id` (`phase_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `case_rule_element_type` (
  `rule_element_type_id` tinyint(3) unsigned NOT NULL auto_increment,
  `label` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`rule_element_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
INSERT INTO `case_rule_element_type` VALUES (1,'option','dwalke01','2011-04-14 06:01:49','dwalke01','2011-04-14 06:01:49'),(2,'test','dwalke01','2011-04-14 06:01:49','dwalke01','2011-04-14 06:01:49'),(3,'quiz','dwalke01','2011-04-14 06:01:49','dwalke01','2011-04-14 06:01:49'),(4,'quiz_question','dwalke01','2011-04-14 06:01:49','dwalke01','2011-04-14 06:01:49'),(5,'quiz_score','dwalke01','2011-04-14 06:01:49','dwalke01','2011-04-14 06:01:49');

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `case_rule_history` (
  `rule_history_id` int(10) unsigned NOT NULL auto_increment,
  `rule_id` int(10) unsigned NOT NULL,
  `phase_id` int(10) unsigned NOT NULL,
  `rule_operator_type_id` tinyint(3) unsigned NOT NULL,
  `message` text CHARACTER SET utf8,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`rule_history_id`),
  KEY `rule_id` (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `case_rule_operand` (
  `rule_operand_id` int(10) unsigned NOT NULL auto_increment,
  `rule_id` int(10) unsigned NOT NULL,
  `phase_id` int(10) unsigned NOT NULL,
  `element_id` int(10) unsigned default NULL,
  `rule_element_type_id` tinyint(3) unsigned default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`rule_operand_id`),
  KEY `rule_id` (`rule_id`),
  CONSTRAINT `case_rule_operand_ibfk_1` FOREIGN KEY (`rule_id`) REFERENCES `case_rule` (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `case_rule_operand_history` (
  `rule_operand_history_id` int(10) unsigned NOT NULL auto_increment,
  `rule_operand_id` int(10) unsigned NOT NULL,
  `rule_id` int(10) unsigned NOT NULL,
  `phase_id` int(10) unsigned NOT NULL,
  `element_id` int(10) unsigned default NULL,
  `rule_element_type_id` tinyint(3) unsigned default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`rule_operand_history_id`),
  KEY `rule_operand_id` (`rule_operand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `case_rule_relation_type` (
  `rule_relation_type_id` tinyint(3) unsigned NOT NULL auto_increment,
  `label` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`rule_relation_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
INSERT INTO `case_rule_relation_type` VALUES (1,'==','dwalke01','2011-04-14 06:01:49','dwalke01','2011-04-14 06:01:49'),(2,'!=','dwalke01','2011-04-14 06:01:49','dwalke01','2011-04-14 06:01:49'),(3,'>','dwalke01','2011-04-14 06:01:49','dwalke01','2011-04-14 06:01:49'),(4,'<','dwalke01','2011-04-14 06:01:49','dwalke01','2011-04-14 06:01:49'),(5,'>=','dwalke01','2011-04-14 06:01:49','dwalke01','2011-04-14 06:01:49'),(6,'<=','dwalke01','2011-04-14 06:01:49','dwalke01','2011-04-14 06:01:49');

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `case_rule_operand_relation` (
  `rule_operand_relation_id` int(10) unsigned NOT NULL auto_increment,
  `rule_operand_id` int(10) unsigned NOT NULL,
  `rule_relation_type_id` tinyint(3) unsigned NOT NULL,
  `value` tinyint(3) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`rule_operand_relation_id`),
  KEY `rule_operand_id` (`rule_operand_id`),
  KEY `rule_relation_type_id` (`rule_relation_type_id`),
  CONSTRAINT `case_rule_operand_relation_ibfk_1` FOREIGN KEY (`rule_operand_id`) REFERENCES `case_rule_operand` (`rule_operand_id`),
  CONSTRAINT `case_rule_operand_relation_ibfk_2` FOREIGN KEY (`rule_relation_type_id`) REFERENCES `case_rule_relation_type` (`rule_relation_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `case_rule_operand_relation_history` (
  `rule_operand_relation_history_id` int(10) unsigned NOT NULL auto_increment,
  `rule_operand_relation_id` int(10) unsigned NOT NULL,
  `rule_operand_id` int(10) unsigned NOT NULL,
  `rule_relation_type_id` tinyint(3) unsigned NOT NULL,
  `value` tinyint(3) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`rule_operand_relation_history_id`),
  KEY `rule_operand_relation_id` (`rule_operand_relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `case_rule_operator_type` (
  `rule_operator_type_id` tinyint(3) unsigned NOT NULL auto_increment,
  `label` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`rule_operator_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
INSERT INTO `case_rule_operator_type` VALUES (1,'AND','dwalke01','2011-04-14 06:01:49','dwalke01','2011-04-14 06:01:49'),(2,'OR','dwalke01','2011-04-14 06:01:49','dwalke01','2011-04-14 06:01:49');

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `case_test` (
  `test_id` int(10) unsigned NOT NULL auto_increment,
  `battery_id` int(10) unsigned NOT NULL default '0',
  `master_test_id` int(10) unsigned default NULL,
  `has_sub_test` int(1) unsigned default '0',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `default_cost` float default '0',
  `units` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `sort_order` int(10) unsigned NOT NULL default '999999999',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`test_id`),
  KEY `master_test_id` (`master_test_id`),
  KEY `battery_id` (`battery_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `case_test_history` (
  `test_history_id` int(10) unsigned NOT NULL auto_increment,
  `test_id` int(10) unsigned NOT NULL default '0',
  `battery_id` int(10) unsigned NOT NULL default '0',
  `master_test_id` int(10) unsigned default NULL,
  `has_sub_test` int(1) unsigned default '0',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `default_cost` float default '0',
  `units` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `sort_order` int(10) unsigned NOT NULL default '999999999',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`test_history_id`),
  KEY `test_id` (`test_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `case_test_selection` (
  `test_selection_id` int(10) unsigned NOT NULL auto_increment,
  `case_report_id` int(10) unsigned NOT NULL default '0',
  `phase_id` int(10) unsigned NOT NULL default '0',
  `phase_visit_id` int(10) unsigned NOT NULL default '0',
  `test_id` int(10) unsigned NOT NULL default '0',
  `test_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`test_selection_id`),
  UNIQUE KEY `test_selection_u01` (`case_report_id`,`phase_id`,`test_id`),
  KEY `test_selection_i01` (`case_report_id`),
  KEY `test_selection_i02` (`phase_id`),
  KEY `test_selection_i03` (`test_id`),
  KEY `phase_visit_id` (`phase_visit_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `case_test_selection_history` (
  `test_selection_history_id` int(10) unsigned NOT NULL auto_increment,
  `test_selection_id` int(10) unsigned NOT NULL default '0',
  `case_report_id` int(10) unsigned NOT NULL default '0',
  `phase_id` int(10) unsigned NOT NULL default '0',
  `phase_visit_id` int(10) unsigned NOT NULL default '0',
  `test_id` int(10) unsigned NOT NULL default '0',
  `test_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`test_selection_history_id`),
  KEY `test_selection_id` (`test_selection_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `case_test_value` (
  `test_value_id` int(10) unsigned NOT NULL auto_increment,
  `test_id` int(10) unsigned NOT NULL default '0',
  `patient_type_id` int(10) unsigned NOT NULL default '0',
  `default_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `default_content_id` int(10) unsigned default NULL,
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`test_value_id`),
  UNIQUE KEY `test_value_u01` (`patient_type_id`,`test_id`),
  KEY `test_id` (`test_id`),
  KEY `patient_type_id` (`patient_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `case_test_value_history` (
  `test_value_history_id` int(10) unsigned NOT NULL auto_increment,
  `test_value_id` int(10) unsigned NOT NULL default '0',
  `test_id` int(10) unsigned NOT NULL default '0',
  `patient_type_id` int(10) unsigned NOT NULL default '0',
  `default_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `default_content_id` int(10) unsigned default NULL,
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`test_value_history_id`),
  KEY `test_value_id` (`test_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `class_meeting_content_type` (
  `class_meeting_content_type_id` int(11) NOT NULL auto_increment,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`class_meeting_content_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
INSERT INTO `class_meeting_content_type` VALUES (1,'Lectures','bkessler','2005-02-24 06:05:39','bkessler','2005-02-24 06:05:39'),(2,'Assignments','bkessler','2005-02-24 06:05:39','bkessler','2005-02-24 06:05:39'),(3,'Readings','bkessler','2005-02-24 06:05:39','bkessler','2005-02-24 06:05:39'),(4,'Slide Collections','bkessler','2005-03-10 18:15:45','bkessler','2005-03-10 18:15:45'),(5,'Student Notes','bkessler','2005-03-18 13:58:32','bkessler','2005-03-18 13:58:32'),(6,'Lecture Handouts','bkessler','2005-03-18 13:58:42','bkessler','2005-03-18 13:58:42'),(7,'Seminars','psilev01','2005-05-17 13:10:16','psilev01','2005-05-17 13:10:16'),(8,'Lessons','psilev01','2006-05-26 16:47:35','psilev01','2006-05-26 16:47:35'),(9,'Topics','psilev01','2006-05-26 16:47:39','psilev01','2006-05-26 16:47:39'),(10,'Learning Units','psilev01','2006-05-26 16:47:44','psilev01','2006-05-26 16:47:44'),(11,'Activities','psilev01','2006-05-26 16:47:52','psilev01','2006-05-26 16:47:52'),(12,'Projects','psilev01','2006-06-13 15:42:28','psilev01','2006-06-13 15:42:28');

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `class_meeting_keyword` (
  `class_meeting_keyword_id` int(10) unsigned NOT NULL auto_increment,
  `class_meeting_id` int(10) unsigned NOT NULL default '0',
  `keyword_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `school_id` int(10) NOT NULL default '0',
  `sort_order` int(11) NOT NULL default '0',
  `author_weight` tinyint(4) default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`class_meeting_keyword_id`),
  KEY `class_meeting_id` (`class_meeting_id`),
  KEY `keyword_id` (`keyword_id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `class_meeting_keyword_history` (
  `class_meeting_keyword_history_id` int(10) unsigned NOT NULL auto_increment,
  `class_meeting_keyword_id` int(10) unsigned NOT NULL,
  `class_meeting_id` int(10) unsigned NOT NULL default '0',
  `keyword_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `school_id` int(10) NOT NULL default '0',
  `sort_order` int(11) NOT NULL default '0',
  `author_weight` tinyint(4) default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`class_meeting_keyword_history_id`),
  KEY `class_meeting_id` (`class_meeting_id`),
  KEY `keyword_id` (`keyword_id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `class_meeting_objective` (
  `class_meeting_objective_id` int(10) unsigned NOT NULL auto_increment,
  `class_meeting_id` int(10) unsigned NOT NULL default '0',
  `objective_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `school_id` int(10) NOT NULL default '0',
  `sort_order` int(11) NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`class_meeting_objective_id`),
  KEY `class_meeting_id` (`class_meeting_id`),
  KEY `objective_id` (`objective_id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `class_meeting_objective_history` (
  `class_meeting_objective_history_id` int(10) unsigned NOT NULL auto_increment,
  `class_meeting_objective_id` int(10) unsigned NOT NULL,
  `class_meeting_id` int(10) unsigned NOT NULL default '0',
  `objective_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `school_id` int(10) NOT NULL default '0',
  `sort_order` int(11) NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`class_meeting_objective_history_id`),
  KEY `class_meeting_id` (`class_meeting_id`),
  KEY `objective_id` (`objective_id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `school` (
  `school_id` int(10) unsigned NOT NULL auto_increment,
  `school_display` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `school_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `school_db` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `class_meeting_type` (
  `class_meeting_type_id` int(10) unsigned NOT NULL auto_increment,
  `school_id` int(10) unsigned NOT NULL,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`class_meeting_type_id`),
  KEY `school_id` (`school_id`,`label`),
  CONSTRAINT `class_meeting_type_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `coding_type` (
  `coding_type_id` int(10) unsigned NOT NULL auto_increment,
  `token` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`coding_type_id`),
  KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
INSERT INTO `coding_type` VALUES (1,'procedure','Procedures','migration','2009-09-17 05:19:43','migration','2009-09-17 05:19:43');

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `coding_category` (
  `coding_category_id` int(10) unsigned NOT NULL auto_increment,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `school_id` int(10) unsigned NOT NULL,
  `coding_type_id` int(10) unsigned NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`coding_category_id`),
  KEY `school_id` (`school_id`),
  KEY `coding_type_id` (`coding_type_id`),
  CONSTRAINT `coding_category_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`),
  CONSTRAINT `coding_category_ibfk_2` FOREIGN KEY (`coding_type_id`) REFERENCES `coding_type` (`coding_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `coding_category_history` (
  `coding_category_history_id` int(10) unsigned NOT NULL auto_increment,
  `coding_category_id` int(10) unsigned NOT NULL,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `school_id` int(10) unsigned NOT NULL,
  `coding_type_id` int(10) unsigned NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`coding_category_history_id`),
  KEY `school_id` (`school_id`),
  KEY `coding_type_id` (`coding_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `coding_code` (
  `coding_code_id` int(10) unsigned NOT NULL auto_increment,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `coding_category_id` int(10) unsigned NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`coding_code_id`),
  KEY `coding_category_id` (`coding_category_id`),
  CONSTRAINT `coding_code_ibfk_1` FOREIGN KEY (`coding_category_id`) REFERENCES `coding_category` (`coding_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `coding_code_history` (
  `coding_code_history_id` int(10) unsigned NOT NULL auto_increment,
  `coding_code_id` int(10) unsigned NOT NULL,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `coding_category_id` int(10) unsigned NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`coding_code_history_id`),
  KEY `coding_category_id` (`coding_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `competency` (
  `competency_id` int(10) unsigned NOT NULL auto_increment,
  `school_id` int(10) unsigned NOT NULL,
  `title` varchar(350) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `description` text CHARACTER SET utf8,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`competency_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `competency_ibfk_2` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `competency_competency` (
  `competency_competency_id` int(10) unsigned NOT NULL auto_increment,
  `parent_competency_id` int(10) unsigned default NULL,
  `child_competency_id` int(10) unsigned default NULL,
  `sort_order` tinyint(3) unsigned default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`competency_competency_id`),
  KEY `parent_competency_id` (`parent_competency_id`),
  KEY `child_competency_id` (`child_competency_id`),
  CONSTRAINT `competency_competency_ibfk_1` FOREIGN KEY (`child_competency_id`) REFERENCES `competency` (`competency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `competency_competency_history` (
  `competency_competency_history_id` int(10) unsigned NOT NULL auto_increment,
  `competency_competency_id` int(10) unsigned NOT NULL,
  `parent_competency_id` int(10) unsigned default NULL,
  `child_competency_id` int(10) unsigned default NULL,
  `sort_order` tinyint(3) unsigned default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`competency_competency_history_id`),
  KEY `competency_competency_id` (`competency_competency_id`),
  KEY `parent_competency_id` (`parent_competency_id`),
  KEY `child_competency_id` (`child_competency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `competency_type` (
  `competency_type_id` int(10) unsigned NOT NULL auto_increment,
  `school_id` int(10) unsigned NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`competency_type_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `competency_type_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `competency_competency_type` (
  `competency_competency_type_id` int(10) unsigned NOT NULL auto_increment,
  `competency_id` int(10) unsigned default NULL,
  `competency_type_id` int(10) unsigned default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`competency_competency_type_id`),
  KEY `competency_id` (`competency_id`),
  KEY `competency_type_id` (`competency_type_id`),
  CONSTRAINT `competency_competency_type_ibfk_1` FOREIGN KEY (`competency_id`) REFERENCES `competency` (`competency_id`),
  CONSTRAINT `competency_competency_type_ibfk_2` FOREIGN KEY (`competency_type_id`) REFERENCES `competency_type` (`competency_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `competency_competency_type_history` (
  `competency_competency_type_history_id` int(10) unsigned NOT NULL auto_increment,
  `competency_competency_type_id` int(10) unsigned NOT NULL,
  `competency_id` int(10) unsigned default NULL,
  `competency_type_id` int(10) unsigned default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`competency_competency_type_history_id`),
  KEY `competency_competency_type_id` (`competency_competency_type_id`),
  KEY `competency_id` (`competency_id`),
  KEY `competency_type_id` (`competency_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `competency_history` (
  `competency_history_id` int(10) unsigned NOT NULL auto_increment,
  `competency_id` int(10) unsigned NOT NULL,
  `school_id` int(10) unsigned NOT NULL,
  `title` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `description` text CHARACTER SET utf8,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`competency_history_id`),
  KEY `competency_id` (`competency_id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `competency_relationship` (
  `competency_relationship_id` int(10) unsigned NOT NULL auto_increment,
  `school_id` int(10) unsigned default NULL,
  `lineage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `parent_competency_id` int(10) unsigned default '0',
  `child_competency_id` int(10) unsigned default NULL,
  `sort_order` tinyint(3) unsigned default NULL,
  `depth` tinyint(3) unsigned default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`competency_relationship_id`),
  KEY `parent_competency_id` (`parent_competency_id`),
  KEY `child_competency_id` (`child_competency_id`),
  KEY `lineage` (`lineage`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `competency_relationship_ibfk_1` FOREIGN KEY (`child_competency_id`) REFERENCES `competency` (`competency_id`),
  CONSTRAINT `competency_relationship_ibfk_2` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `competency_relationship_history` (
  `competency_relationship_history_id` int(10) unsigned NOT NULL auto_increment,
  `competency_relationship_id` int(10) unsigned NOT NULL,
  `school_id` int(10) unsigned default NULL,
  `lineage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `parent_competency_id` int(10) unsigned default '0',
  `child_competency_id` int(10) unsigned default NULL,
  `sort_order` tinyint(3) unsigned default NULL,
  `depth` tinyint(3) unsigned default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`competency_relationship_history_id`),
  KEY `competency_relationship_id` (`competency_relationship_id`),
  KEY `parent_competency_id` (`parent_competency_id`),
  KEY `child_competency_id` (`child_competency_id`),
  KEY `lineage` (`lineage`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `competency_type_history` (
  `competency_type_history_id` int(10) unsigned NOT NULL auto_increment,
  `competency_type_id` int(10) unsigned NOT NULL,
  `school_id` int(10) unsigned NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`competency_type_history_id`),
  KEY `school_id` (`school_id`),
  KEY `competency_type_id` (`competency_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `configuration_variable` (
  `configuration_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` text CHARACTER SET utf8,
  `description` text CHARACTER SET utf8,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`configuration_id`),
  UNIQUE KEY `name` (`name`),
  KEY `name_2` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `configuration_variable_history` (
  `configuration_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` text CHARACTER SET utf8,
  `description` text CHARACTER SET utf8,
  `history_action` enum('Insert','Update','Delete') default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`configuration_id`),
  UNIQUE KEY `name` (`name`),
  KEY `name_2` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `constant_variable` (
  `constant_variable_id` int(10) unsigned NOT NULL auto_increment,
  `constant_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `constant_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`constant_variable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `content_external_field` (
  `field_id` int(10) unsigned NOT NULL auto_increment,
  `source_id` int(10) unsigned NOT NULL default '0',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `token` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `sort_order` int(10) unsigned NOT NULL default '0',
  `required` enum('Y','N') default 'Y',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`field_id`),
  KEY `source_id` (`source_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
INSERT INTO `content_external_field` VALUES (1,1,'Accession Number','AN',1,'N','isathi01','2008-07-09 14:16:45','isathi01','2008-07-09 14:16:45'),(2,1,'Unique Identifier','UI',2,'Y','isathi01','2008-07-09 14:16:45','isathi01','2008-07-09 14:16:45'),(3,2,'Accession Number','AN',1,'Y','isathi01','2008-07-09 14:16:45','isathi01','2008-07-09 14:16:45'),(4,3,'Accession Number','AN',1,'Y','isathi01','2008-07-09 14:16:45','isathi01','2008-07-09 14:16:45'),(5,4,'Accession Number','AN',1,'Y','isathi01','2008-07-09 14:16:45','isathi01','2008-07-09 14:16:45'),(6,5,'Accession Number','AN',1,'Y','isathi01','2008-07-09 14:16:45','isathi01','2008-07-09 14:16:45');

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `content_external_link_content_field` (
  `link_content_field_id` int(10) unsigned NOT NULL auto_increment,
  `parent_content_id` int(10) unsigned NOT NULL default '0',
  `child_field_id` int(10) unsigned NOT NULL default '0',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`link_content_field_id`),
  KEY `child_field_id` (`child_field_id`),
  KEY `parent_content_id` (`parent_content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `content_external_link_content_field_history` (
  `link_content_field_history_id` int(10) unsigned NOT NULL auto_increment,
  `link_content_field_id` int(10) unsigned NOT NULL default '0',
  `parent_content_id` int(10) unsigned NOT NULL default '0',
  `child_field_id` int(10) unsigned NOT NULL default '0',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`link_content_field_history_id`),
  KEY `link_content_field_id` (`link_content_field_id`),
  KEY `child_field_id` (`child_field_id`),
  KEY `parent_content_id` (`parent_content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `content_external_metadata` (
  `metadata_id` int(10) unsigned NOT NULL auto_increment,
  `content_id` int(10) unsigned NOT NULL default '0',
  `author` tinytext CHARACTER SET utf8,
  `abstract` text CHARACTER SET utf8,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`metadata_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `content_external_metadata_history` (
  `metadata_history_id` int(10) unsigned NOT NULL auto_increment,
  `metadata_id` int(10) unsigned default NULL,
  `content_id` int(10) unsigned NOT NULL default '0',
  `author` tinytext CHARACTER SET utf8,
  `abstract` text CHARACTER SET utf8,
  `history_action` enum('Insert','Update','Delete') default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`metadata_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `content_external_source` (
  `source_id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `instructions` text CHARACTER SET utf8,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`source_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
INSERT INTO `content_external_source` VALUES (1,'Medline/PubMed','medline','','isathi01','2008-07-09 14:16:45','isathi01','2008-07-09 14:16:45');

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `content_external_url` (
  `url_id` int(10) unsigned NOT NULL auto_increment,
  `content_id` int(10) unsigned NOT NULL default '0',
  `url` tinytext CHARACTER SET utf8,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`url_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `content_external_url_history` (
  `url_history_id` int(10) unsigned NOT NULL auto_increment,
  `url_id` int(10) unsigned default NULL,
  `content_id` int(10) unsigned NOT NULL default '0',
  `url` tinytext CHARACTER SET utf8,
  `history_action` enum('Insert','Update','Delete') default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`url_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `course` (
  `course_id` int(10) unsigned NOT NULL auto_increment,
  `school_id` int(10) unsigned NOT NULL default '0',
  `school_course_code` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`course_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `course_code` (
  `course_code_id` int(10) unsigned NOT NULL auto_increment,
  `school_id` int(10) NOT NULL default '0',
  `course_id` int(10) NOT NULL default '0',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `code_type` enum('SIS','REG') default 'SIS',
  `teaching_site_id` int(10) NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`course_code_id`),
  KEY `course_code_i01` (`code`),
  KEY `course_code_i02` (`school_id`),
  KEY `course_code_i03` (`course_id`),
  KEY `course_code_tsi` (`teaching_site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `course_code_history` (
  `course_code_history_id` int(10) unsigned NOT NULL auto_increment,
  `course_code_id` int(10) NOT NULL default '0',
  `school_id` int(10) NOT NULL default '0',
  `course_id` int(10) NOT NULL default '0',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `code_type` enum('SIS') NOT NULL default 'SIS',
  `teaching_site_id` int(10) NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') NOT NULL default 'Insert',
  PRIMARY KEY  (`course_code_history_id`),
  KEY `course_code_history_i01` (`code`),
  KEY `course_code_history_i02` (`school_id`),
  KEY `course_code_history_i03` (`course_id`),
  KEY `course_code_history_i04` (`course_code_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `course_exclusion` (
  `course_exclusion_id` int(10) unsigned NOT NULL auto_increment,
  `course_id` int(10) NOT NULL default '0',
  `course_exclusion_type_id` int(10) NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`course_exclusion_id`),
  KEY `course_id` (`course_id`),
  KEY `course_exclusion_type_id` (`course_exclusion_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `course_exclusion_history` (
  `course_exclusion_history_id` int(10) unsigned NOT NULL auto_increment,
  `course_exclusion_id` int(10) unsigned NOT NULL,
  `course_id` int(10) NOT NULL default '0',
  `course_exclusion_type_id` int(10) NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`course_exclusion_history_id`),
  KEY `course_exclusion_id` (`course_exclusion_id`),
  KEY `course_id` (`course_id`),
  KEY `course_exclusion_type_id` (`course_exclusion_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `course_exclusion_type` (
  `course_exclusion_type_id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`course_exclusion_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
INSERT INTO `course_exclusion_type` VALUES (1,'curriculum report','','0000-00-00 00:00:00',NULL,NULL);

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `course_history` (
  `course_id_history` int(10) unsigned NOT NULL auto_increment,
  `course_id` int(10) unsigned NOT NULL default '0',
  `school_id` int(10) unsigned NOT NULL default '0',
  `school_course_code` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`course_id_history`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `course_metadata_display` (
  `metadata_display_id` int(10) unsigned NOT NULL auto_increment,
  `display_title` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sort_order` int(11) default NULL,
  `parent` int(11) default NULL,
  `edit_type` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `edit_comment` text CHARACTER SET utf8,
  `locked` int(11) default NULL,
  `school_id` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`metadata_display_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `course_metadata_display_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `course_metadata` (
  `metadata_id` int(10) unsigned NOT NULL auto_increment,
  `course_id` int(10) unsigned NOT NULL default '0',
  `metadata_type` int(10) unsigned NOT NULL default '0',
  `value` text CHARACTER SET utf8,
  `parent` int(10) unsigned default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`metadata_id`),
  KEY `course_id` (`course_id`),
  KEY `metadata_type` (`metadata_type`),
  CONSTRAINT `course_metadata_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `course_metadata_ibfk_2` FOREIGN KEY (`metadata_type`) REFERENCES `course_metadata_display` (`metadata_display_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `course_metadata_display_history` (
  `metadata_display_id_history` int(10) unsigned NOT NULL auto_increment,
  `metadata_display_id` int(10) unsigned NOT NULL default '0',
  `display_title` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sort_order` int(11) default NULL,
  `parent` int(11) default NULL,
  `edit_type` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `edit_comment` text CHARACTER SET utf8,
  `locked` int(11) default NULL,
  `school_id` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`metadata_display_id_history`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `course_metadata_history` (
  `metadata_id_history` int(10) unsigned NOT NULL auto_increment,
  `metadata_id` int(10) unsigned NOT NULL default '0',
  `course_id` int(10) unsigned NOT NULL default '0',
  `metadata_type` int(10) unsigned NOT NULL default '0',
  `value` text CHARACTER SET utf8,
  `parent` int(10) unsigned default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`metadata_id_history`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `shibboleth_user` (
  `shibboleth_user_id` int(10) unsigned NOT NULL auto_increment,
  `shibboleth_institution_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `http_variable` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `http_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `user_greeting` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `enabled` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `logout_page` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `needs_regen` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci default 'N',
  `IdPXML` text CHARACTER SET utf8,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`shibboleth_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `course_sharing` (
  `course_sharing_id` int(10) unsigned NOT NULL auto_increment,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `course_id` int(10) unsigned NOT NULL default '0',
  `shared_with` int(10) unsigned NOT NULL default '0',
  `avaliable_from` datetime NOT NULL default '0000-00-00 00:00:00',
  `avaliable_to` datetime NOT NULL default '0000-00-00 00:00:00',
  `authorizing_note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`course_sharing_id`),
  KEY `course_id` (`course_id`),
  KEY `shared_with` (`shared_with`),
  CONSTRAINT `course_sharing_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE,
  CONSTRAINT `course_sharing_ibfk_2` FOREIGN KEY (`shared_with`) REFERENCES `shibboleth_user` (`shibboleth_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `course_sharing_history` (
  `course_sharing_id_history` int(10) unsigned NOT NULL auto_increment,
  `course_sharing_id` int(10) unsigned NOT NULL default '0',
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `course_id` int(10) unsigned NOT NULL default '0',
  `shared_with` int(10) unsigned NOT NULL default '0',
  `avaliable_from` datetime NOT NULL default '0000-00-00 00:00:00',
  `avaliable_to` datetime NOT NULL default '0000-00-00 00:00:00',
  `authorizing_note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`course_sharing_id_history`),
  KEY `shared_with` (`shared_with`),
  KEY `course_sharing_id` (`course_sharing_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `course_sharing_history_ibfk_1` FOREIGN KEY (`shared_with`) REFERENCES `shibboleth_user` (`shibboleth_user_id`),
  CONSTRAINT `course_sharing_history_ibfk_2` FOREIGN KEY (`course_sharing_id`) REFERENCES `course_sharing` (`course_sharing_id`) ON DELETE CASCADE,
  CONSTRAINT `course_sharing_history_ibfk_3` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `course_standard_scale` (
  `course_standard_scale_id` int(10) unsigned NOT NULL auto_increment,
  `lower_bound` int(10) default NULL,
  `grade` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_on` datetime default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`course_standard_scale_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
INSERT INTO `course_standard_scale` VALUES (1,94,'A','scorde01','2009-03-01 00:00:00','scorde01','2009-03-01 00:00:00'),(2,90,'A-','scorde01','2009-03-01 00:00:00','scorde01','2009-03-01 00:00:00'),(3,87,'B+','scorde01','2009-03-01 00:00:00','scorde01','2009-03-01 00:00:00'),(4,84,'B','scorde01','2009-03-01 00:00:00','scorde01','2009-03-01 00:00:00'),(5,80,'B-','scorde01','2009-03-01 00:00:00','scorde01','2009-03-01 00:00:00'),(6,77,'C+','scorde01','2009-03-01 00:00:00','scorde01','2009-03-01 00:00:00'),(7,74,'C','scorde01','2009-03-01 00:00:00','scorde01','2009-03-01 00:00:00'),(8,70,'C-','scorde01','2009-03-01 00:00:00','scorde01','2009-03-01 00:00:00'),(9,67,'D+','scorde01','2009-03-01 00:00:00','scorde01','2009-03-01 00:00:00'),(10,64,'D','scorde01','2009-03-01 00:00:00','scorde01','2009-03-01 00:00:00'),(11,60,'D-','scorde01','2009-03-01 00:00:00','scorde01','2009-03-01 00:00:00'),(12,0,'F','scorde01','2009-03-01 00:00:00','scorde01','2009-03-01 00:00:00');

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `cron_job_variable` (
  `cron_job_variable_id` int(11) NOT NULL auto_increment,
  `cron_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `host_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `variable_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `variable_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`cron_job_variable_id`),
  UNIQUE KEY `cron_job_variabls_u01` (`cron_name`,`variable_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `email_template` (
  `email_template_id` int(10) unsigned NOT NULL auto_increment,
  `email_template_type_id` tinyint(3) unsigned NOT NULL default '0',
  `school_id` int(10) unsigned NOT NULL default '0',
  `label` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `subject` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `body` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  PRIMARY KEY  (`email_template_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `email_template_type` (
  `email_template_type_id` tinyint(3) unsigned NOT NULL auto_increment,
  `email_template_type` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY  (`email_template_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
INSERT INTO `email_template_type` VALUES (1,'Eval Completion');

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `entity_type` (
  `entity_type_id` tinyint(3) unsigned NOT NULL auto_increment,
  `token` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`entity_type_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `entity_type_label` (
  `entity_type_label_id` int(10) unsigned NOT NULL auto_increment,
  `school_id` int(10) unsigned NOT NULL,
  `entity_type_id` tinyint(3) unsigned NOT NULL,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`entity_type_label_id`),
  KEY `school_id` (`school_id`),
  KEY `entity_type_id` (`entity_type_id`),
  CONSTRAINT `entity_type_label_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`),
  CONSTRAINT `entity_type_label_ibfk_2` FOREIGN KEY (`entity_type_id`) REFERENCES `entity_type` (`entity_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `entity_type_label_history` (
  `entity_type_label_history` int(10) unsigned NOT NULL auto_increment,
  `entity_type_label_id` int(10) unsigned NOT NULL,
  `school_id` int(10) unsigned NOT NULL,
  `entity_type_id` tinyint(3) unsigned NOT NULL,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`entity_type_label_history`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `eval_group` (
  `eval_group_id` int(10) unsigned NOT NULL auto_increment,
  `school_id` int(10) unsigned NOT NULL default '0',
  `course_id` int(10) unsigned NOT NULL default '0',
  `time_period_id` int(10) unsigned NOT NULL default '0',
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `instructions` text CHARACTER SET utf8,
  `available_date` datetime default NULL,
  `due_date` datetime default NULL,
  `template_eval_id` int(10) unsigned NOT NULL default '0',
  `show_name_flag` int(1) unsigned default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`eval_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `eval_group_eval` (
  `eval_group_eval_id` int(10) unsigned NOT NULL auto_increment,
  `parent_eval_group_id` int(10) unsigned NOT NULL default '0',
  `child_eval_id` int(10) unsigned NOT NULL default '0',
  `user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`eval_group_eval_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `eval_group_eval_history` (
  `eval_group_eval_history_id` int(10) unsigned NOT NULL auto_increment,
  `eval_group_eval_id` int(10) unsigned default NULL,
  `parent_eval_group_id` int(10) unsigned NOT NULL default '0',
  `child_eval_id` int(10) unsigned NOT NULL default '0',
  `user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `history_action` enum('Insert','Update','Delete') default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`eval_group_eval_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `eval_group_history` (
  `eval_group_history_id` int(10) unsigned NOT NULL auto_increment,
  `eval_group_id` int(10) unsigned NOT NULL default '0',
  `school_id` int(10) unsigned NOT NULL default '0',
  `course_id` int(10) unsigned NOT NULL default '0',
  `time_period_id` int(10) unsigned NOT NULL default '0',
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `instructions` text CHARACTER SET utf8,
  `available_date` datetime default NULL,
  `due_date` datetime default NULL,
  `template_eval_id` int(10) unsigned NOT NULL default '0',
  `show_name_flag` int(1) unsigned default '0',
  `history_action` enum('Insert','Update','Delete') default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`eval_group_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `eval_load_time` (
  `eval_load_time_id` int(10) unsigned NOT NULL auto_increment,
  `school_id` int(10) unsigned NOT NULL default '0',
  `eval_id` int(10) unsigned NOT NULL default '0',
  `load_time` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`eval_load_time_id`),
  KEY `time_by_eval` (`school_id`,`eval_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `eval_prototype` (
  `eval_prototype_id` int(10) unsigned NOT NULL auto_increment,
  `school_id` int(10) unsigned NOT NULL default '0',
  `eval_id` int(10) unsigned NOT NULL default '0',
  `course_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `exact_match` enum('Y','N') NOT NULL default 'Y',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`eval_prototype_id`),
  KEY `course_code` (`course_code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `eval_prototype_history` (
  `eval_prototype_history_id` int(10) unsigned NOT NULL auto_increment,
  `eval_prototype_id` int(10) unsigned NOT NULL default '0',
  `school_id` int(10) unsigned NOT NULL default '0',
  `eval_id` int(10) unsigned NOT NULL default '0',
  `course_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `exact_match` enum('Y','N') NOT NULL default 'Y',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`eval_prototype_history_id`),
  KEY `course_code` (`course_code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `flash_card` (
  `flash_card_id` int(10) unsigned NOT NULL auto_increment,
  `question` text CHARACTER SET utf8,
  `answer` text CHARACTER SET utf8,
  `content_id` int(10) unsigned default NULL,
  `parent_personal_content_id` int(10) unsigned default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_on` datetime default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`flash_card_id`),
  KEY `parent_personal_content_id` (`parent_personal_content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `flash_card_history` (
  `flash_card_id_history` int(10) unsigned NOT NULL auto_increment,
  `flash_card_id` int(10) unsigned NOT NULL,
  `question` text CHARACTER SET utf8,
  `answer` text CHARACTER SET utf8,
  `content_id` int(10) unsigned default NULL,
  `parent_personal_content_id` int(10) unsigned default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_on` datetime default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`flash_card_id_history`),
  KEY `parent_personal_content_id` (`parent_personal_content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_assessment` (
  `assessment_id` int(10) unsigned NOT NULL auto_increment,
  `form_id` int(10) unsigned NOT NULL,
  `score_display` tinyint(1) unsigned NOT NULL default '0',
  `score_range` tinyint(1) unsigned NOT NULL default '0',
  `show_images` tinyint(1) unsigned NOT NULL default '0',
  `show_elective` tinyint(1) unsigned NOT NULL default '0',
  `multi_assessors` tinyint(1) unsigned NOT NULL default '0',
  `show_assigned` tinyint(1) unsigned NOT NULL default '0',
  `student_selection` tinyint(1) unsigned NOT NULL default '0',
  `frequency` tinyint(2) unsigned NOT NULL default '1',
  `unable_to_assess` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `show_final_comment` tinyint(1) unsigned NOT NULL default '0',
  `final_comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `total_weight` float NOT NULL default '0',
  `min_score` float unsigned default NULL,
  `show_grade_to_assessor` tinyint(1) unsigned NOT NULL default '0',
  `show_grade_to_subject` tinyint(1) unsigned NOT NULL default '0',
  `show_grade_to_registrar` tinyint(1) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`assessment_id`),
  KEY `form_id` (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_assessment_history` (
  `assessment_history_id` int(10) unsigned NOT NULL auto_increment,
  `assessment_id` int(10) unsigned NOT NULL,
  `form_id` int(10) unsigned NOT NULL,
  `score_display` tinyint(1) unsigned NOT NULL default '0',
  `score_range` tinyint(1) unsigned NOT NULL default '0',
  `show_images` tinyint(1) unsigned NOT NULL default '0',
  `show_elective` tinyint(1) unsigned NOT NULL default '0',
  `multi_assessors` tinyint(1) unsigned NOT NULL default '0',
  `show_assigned` tinyint(1) unsigned NOT NULL default '0',
  `student_selection` tinyint(1) unsigned NOT NULL default '0',
  `frequency` tinyint(2) unsigned NOT NULL default '1',
  `unable_to_assess` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `show_final_comment` tinyint(1) unsigned NOT NULL default '0',
  `final_comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `total_weight` float NOT NULL default '0',
  `min_score` float unsigned default NULL,
  `show_grade_to_assessor` tinyint(1) unsigned NOT NULL default '0',
  `show_grade_to_subject` tinyint(1) unsigned NOT NULL default '0',
  `show_grade_to_registrar` tinyint(1) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`assessment_history_id`),
  KEY `form_id` (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_attribute` (
  `attribute_id` int(10) unsigned NOT NULL auto_increment,
  `attribute_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `attribute_type_id` int(10) unsigned NOT NULL default '0',
  `field_id` int(10) unsigned default NULL,
  `sort_order` int(10) unsigned default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`attribute_id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_attribute_history` (
  `attribute_history_id` int(10) unsigned NOT NULL auto_increment,
  `attribute_id` int(10) unsigned NOT NULL default '0',
  `attribute_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `attribute_type_id` int(10) unsigned NOT NULL default '0',
  `field_id` int(10) unsigned default NULL,
  `sort_order` int(10) unsigned default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`attribute_history_id`),
  KEY `attribute_id` (`attribute_id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_attribute_item` (
  `item_id` int(10) unsigned NOT NULL auto_increment,
  `item_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `abbreviation` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `attribute_id` int(10) unsigned default NULL,
  `sort_order` int(10) unsigned default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`item_id`),
  KEY `attribute_id` (`attribute_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_attribute_item_history` (
  `item_history_id` int(10) unsigned NOT NULL auto_increment,
  `item_id` int(10) unsigned NOT NULL default '0',
  `item_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `abbreviation` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `attribute_id` int(10) unsigned default NULL,
  `sort_order` int(10) unsigned default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`item_history_id`),
  KEY `item_id` (`item_id`),
  KEY `attribute_id` (`attribute_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_attribute_type` (
  `attribute_type_id` int(10) unsigned NOT NULL auto_increment,
  `token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`attribute_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
INSERT INTO `form_builder_attribute_type` VALUES (1,'DropDown','Drop Down','psilev01','2005-07-01 10:34:44','psilev01','2005-07-01 10:34:44'),(2,'RadioSelect','Radio Select','psilev01','2005-07-01 10:34:44','psilev01','2005-07-01 10:34:44');

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_attribute_type_history` (
  `attribute_type_history_id` int(10) unsigned NOT NULL auto_increment,
  `attribute_type_id` int(10) unsigned NOT NULL default '0',
  `token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`attribute_type_history_id`),
  KEY `attribute_type_id` (`attribute_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_course_user_group` (
  `course_user_group_id` int(10) unsigned NOT NULL auto_increment,
  `course_id` int(10) unsigned NOT NULL,
  `user_group_id` int(10) unsigned NOT NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`course_user_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_course_user_group_history` (
  `course_user_group_history_id` int(10) unsigned NOT NULL auto_increment,
  `course_user_group_id` int(10) unsigned NOT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `user_group_id` int(10) unsigned NOT NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`course_user_group_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_entry` (
  `entry_id` int(10) unsigned NOT NULL auto_increment,
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `date` date default NULL,
  `form_id` int(10) unsigned NOT NULL default '0',
  `time_period_id` int(10) unsigned NOT NULL default '0',
  `complete_date` datetime default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`entry_id`),
  KEY `form_id` (`form_id`),
  KEY `user_id` (`user_id`),
  KEY `time_period_id` (`time_period_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_entry_association` (
  `entry_association_id` int(10) unsigned NOT NULL auto_increment,
  `entry_id` int(10) unsigned NOT NULL,
  `user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_final` tinyint(1) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`entry_association_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_entry_association_history` (
  `entry_association_history_id` int(10) unsigned NOT NULL auto_increment,
  `entry_association_id` int(10) unsigned NOT NULL,
  `entry_id` int(10) unsigned NOT NULL,
  `user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_final` tinyint(1) unsigned NOT NULL default '0',
  `history_action` enum('Insert','Update','Delete') default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`entry_association_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_entry_grade` (
  `entry_grade_id` int(10) unsigned NOT NULL auto_increment,
  `entry_id` int(10) unsigned NOT NULL,
  `score` float unsigned default NULL,
  `comments` text CHARACTER SET utf8,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`entry_grade_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_entry_grade_history` (
  `entry_grade_history_id` int(10) unsigned NOT NULL auto_increment,
  `entry_grade_id` int(10) unsigned NOT NULL,
  `entry_id` int(10) unsigned NOT NULL,
  `score` float unsigned default NULL,
  `comments` text CHARACTER SET utf8,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`entry_grade_history_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_entry_history` (
  `entry_history_id` int(10) unsigned NOT NULL auto_increment,
  `entry_id` int(10) unsigned NOT NULL default '0',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `date` date default NULL,
  `form_id` int(10) unsigned NOT NULL default '0',
  `time_period_id` int(10) unsigned NOT NULL default '0',
  `complete_date` datetime default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`entry_history_id`),
  KEY `entry_id` (`entry_id`),
  KEY `form_id` (`form_id`),
  KEY `user_id` (`user_id`),
  KEY `time_period_id` (`time_period_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_field` (
  `field_id` int(10) unsigned NOT NULL auto_increment,
  `field_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `abbreviation` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `field_description` text CHARACTER SET utf8,
  `field_type_id` int(10) unsigned NOT NULL default '0',
  `item_sort` enum('Alphanumeric','User-Defined') default 'Alphanumeric',
  `default_report` int(1) unsigned default '0',
  `required` int(1) unsigned NOT NULL default '0',
  `private` int(1) unsigned NOT NULL default '0',
  `fillin_size` int(10) unsigned NOT NULL default '0',
  `show_comment` tinyint(1) unsigned NOT NULL default '0',
  `trailing_text` text CHARACTER SET utf8,
  `weight` float NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`field_id`),
  KEY `field_type_id` (`field_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_field_comment` (
  `field_comment_id` int(10) unsigned NOT NULL auto_increment,
  `field_id` int(1) unsigned NOT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sort_order` tinyint(2) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`field_comment_id`),
  KEY `field_id` (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_field_comment_history` (
  `field_comment_history_id` int(10) unsigned NOT NULL auto_increment,
  `field_comment_id` int(10) unsigned NOT NULL,
  `field_id` int(1) unsigned NOT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sort_order` tinyint(2) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`field_comment_history_id`),
  KEY `field_id` (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_field_history` (
  `field_history_id` int(10) unsigned NOT NULL auto_increment,
  `field_id` int(10) unsigned NOT NULL default '0',
  `field_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `abbreviation` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `field_description` text CHARACTER SET utf8,
  `field_type_id` int(10) unsigned NOT NULL default '0',
  `item_sort` enum('Alphanumeric','User-Defined') default 'Alphanumeric',
  `default_report` int(1) unsigned default '0',
  `required` int(1) unsigned NOT NULL default '0',
  `private` int(1) unsigned NOT NULL default '0',
  `fillin_size` int(10) unsigned NOT NULL default '0',
  `show_comment` tinyint(1) unsigned NOT NULL default '0',
  `trailing_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `weight` float NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`field_history_id`),
  KEY `field_id` (`field_id`),
  KEY `field_type_id` (`field_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_field_item` (
  `item_id` int(10) unsigned NOT NULL auto_increment,
  `item_name` text CHARACTER SET utf8,
  `item_type_id` int(10) unsigned default '1',
  `abbreviation` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `field_id` int(10) unsigned default NULL,
  `allow_user_defined_value` int(1) unsigned default '0',
  `content_id` int(10) unsigned default NULL,
  `sort_order` int(10) unsigned default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`item_id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_field_item_history` (
  `item_history_id` int(10) unsigned NOT NULL auto_increment,
  `item_id` int(10) unsigned NOT NULL default '0',
  `item_name` text CHARACTER SET utf8,
  `item_type_id` int(10) unsigned default '1',
  `abbreviation` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `field_id` int(10) unsigned default NULL,
  `allow_user_defined_value` int(1) unsigned default '0',
  `sort_order` int(10) unsigned default NULL,
  `content_id` int(10) unsigned default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`item_history_id`),
  KEY `item_id` (`item_id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_field_type` (
  `field_type_id` int(10) unsigned NOT NULL auto_increment,
  `token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`field_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
INSERT INTO `form_builder_field_type` VALUES (1,'FillIn','Fill In','psilev01','2005-04-12 06:02:45','psilev01','2005-04-12 06:02:45'),(2,'SingleSelect','Single-Select','psilev01','2005-04-12 06:02:45','psilev01','2005-04-12 06:02:45'),(3,'SingleSelectAllowMulti','Single-Select (Allow Multiple)','psilev01','2005-04-12 06:02:45','psilev01','2005-04-12 06:02:45'),(4,'MultiSelect','Multi-Select','psilev01','2005-04-12 06:02:45','psilev01','2005-04-12 06:02:45'),(5,'MultiSelectWithAttributes','Multi-Select (With Attributes)','psilev01','2005-04-12 06:02:45','psilev01','2005-04-12 06:02:45'),(6,'RadioSelect','Radio Select','psilev01','2005-07-01 10:34:44','psilev01','2005-07-01 10:34:44'),(7,'Essay','Essay','psilev01','2005-12-28 06:10:18','psilev01','2005-12-28 06:10:18'),(8,'DynamicList','Dynamic List','isathi01','2008-11-13 11:09:04','isathi01','2008-11-13 11:09:04'),(9,'CheckList','Check List','isathi01','2009-05-07 05:48:56','isathi01','2009-05-07 05:48:56'),(10,'Heading','Heading','isathi01','2009-05-07 05:48:56','isathi01','2009-05-07 05:48:56'),(11,'Scaling','Scaling','isathi01','2010-11-04 06:05:29','isathi01','2010-11-04 06:05:29');

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_field_type_history` (
  `field_type_history_id` int(10) unsigned NOT NULL auto_increment,
  `field_type_id` int(10) unsigned NOT NULL default '0',
  `token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`field_type_history_id`),
  KEY `field_type_id` (`field_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_form` (
  `form_id` int(10) unsigned NOT NULL auto_increment,
  `form_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `form_type_id` int(10) unsigned NOT NULL default '0',
  `form_description` text CHARACTER SET utf8,
  `require_approval` int(1) unsigned default '0',
  `publish_flag` int(1) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`form_id`),
  KEY `form_type_id` (`form_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_form_association` (
  `form_association_id` int(10) unsigned NOT NULL auto_increment,
  `form_id` int(10) unsigned NOT NULL,
  `user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`form_association_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_form_association_history` (
  `form_association_history_id` int(10) unsigned NOT NULL auto_increment,
  `form_association_id` int(10) unsigned NOT NULL,
  `form_id` int(10) unsigned NOT NULL,
  `user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`form_association_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_form_attribute` (
  `attribute_id` int(10) unsigned NOT NULL auto_increment,
  `form_id` int(10) unsigned NOT NULL,
  `sort_order` tinyint(3) NOT NULL default '1',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`attribute_id`),
  KEY `form_id` (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_form_attribute_item` (
  `attribute_item_id` int(10) unsigned NOT NULL auto_increment,
  `attribute_id` int(10) unsigned NOT NULL,
  `sort_order` tinyint(3) NOT NULL default '1',
  `title` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `description` text CHARACTER SET utf8,
  `min_value` tinyint(3) unsigned default NULL,
  `max_value` tinyint(3) unsigned default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`attribute_item_id`),
  KEY `attribute_id` (`attribute_id`),
  CONSTRAINT `form_builder_form_attribute_item_ibfk_1` FOREIGN KEY (`attribute_id`) REFERENCES `form_builder_form_attribute` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_form_attribute_field_item` (
  `attribute_field_item_id` int(10) unsigned NOT NULL auto_increment,
  `attribute_item_id` int(10) unsigned NOT NULL,
  `field_item_id` int(10) unsigned NOT NULL,
  `comment_required` tinyint(1) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`attribute_field_item_id`),
  KEY `attribute_item_id` (`attribute_item_id`),
  KEY `field_item_id` (`field_item_id`),
  CONSTRAINT `form_builder_form_attribute_field_item_ibfk_1` FOREIGN KEY (`attribute_item_id`) REFERENCES `form_builder_form_attribute_item` (`attribute_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_form_attribute_field_item_history` (
  `attribute_field_item_history_id` int(10) unsigned NOT NULL auto_increment,
  `attribute_field_item_id` int(10) unsigned NOT NULL,
  `attribute_item_id` int(10) unsigned NOT NULL,
  `field_item_id` int(10) unsigned NOT NULL,
  `comment_required` tinyint(1) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`attribute_field_item_history_id`),
  KEY `attribute_item_id` (`attribute_item_id`),
  KEY `field_item_id` (`field_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_form_attribute_history` (
  `attribute_history_id` int(10) unsigned NOT NULL auto_increment,
  `attribute_id` int(10) unsigned NOT NULL,
  `form_id` int(10) unsigned NOT NULL,
  `sort_order` tinyint(3) NOT NULL default '1',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`attribute_history_id`),
  KEY `form_id` (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_form_attribute_item_history` (
  `attribute_item_history_id` int(10) unsigned NOT NULL auto_increment,
  `attribute_item_id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  `sort_order` tinyint(3) NOT NULL default '1',
  `title` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `description` text CHARACTER SET utf8,
  `min_value` tinyint(3) unsigned default NULL,
  `max_value` tinyint(3) unsigned default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`attribute_item_history_id`),
  KEY `attribute_id` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_form_grade_event` (
  `form_grade_event_id` int(10) unsigned NOT NULL auto_increment,
  `form_id` int(10) unsigned NOT NULL,
  `grade_event_id` int(10) unsigned NOT NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`form_grade_event_id`),
  UNIQUE KEY `form_id` (`form_id`,`grade_event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_form_grade_event_history` (
  `form_grade_event_history_id` int(10) unsigned NOT NULL auto_increment,
  `form_grade_event_id` int(10) unsigned NOT NULL,
  `form_id` int(10) unsigned NOT NULL,
  `grade_event_id` int(10) unsigned NOT NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`form_grade_event_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_form_history` (
  `form_history_id` int(10) unsigned NOT NULL auto_increment,
  `form_id` int(10) unsigned NOT NULL default '0',
  `form_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `form_type_id` int(10) unsigned NOT NULL default '0',
  `form_description` text CHARACTER SET utf8,
  `require_approval` int(1) unsigned default '0',
  `publish_flag` int(1) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`form_history_id`),
  KEY `form_id` (`form_id`),
  KEY `form_type_id` (`form_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_form_type` (
  `form_type_id` int(10) unsigned NOT NULL auto_increment,
  `token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`form_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
INSERT INTO `form_builder_form_type` VALUES (1,'PatientLog','Patient Log','psilev01','2005-04-12 06:02:45','psilev01','2005-04-12 06:02:45'),(2,'SP','Simulated Patient','isathi01','2009-05-07 05:48:56','isathi01','2009-05-07 05:48:56'),(3,'Assessment','Assessment','isathi01','2010-11-04 06:05:29','isathi01','2010-11-04 06:05:29'),(4,'Assess','Assessment','isathi01','2011-01-27 05:40:39','isathi01','2011-01-27 05:40:39');

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_form_type_history` (
  `form_type_history_id` int(10) unsigned NOT NULL auto_increment,
  `form_type_id` int(10) unsigned NOT NULL default '0',
  `token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`form_type_history_id`),
  KEY `form_type_id` (`form_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_item_type` (
  `item_type_id` int(10) unsigned NOT NULL auto_increment,
  `token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `short_label` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `full_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`item_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
INSERT INTO `form_builder_item_type` VALUES (1,'Item','Item','Item','psilev01','2005-05-31 10:11:59','psilev01','2005-05-31 10:11:59'),(2,'CatStart','Cat Start','Category Start','psilev01','2005-05-31 10:11:59','psilev01','2005-05-31 10:11:59'),(3,'CatEnd','Cat End','Category End','psilev01','2005-05-31 10:11:59','psilev01','2005-05-31 10:11:59');

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_item_type_history` (
  `item_type_history_id` int(10) unsigned NOT NULL auto_increment,
  `item_type_id` int(10) unsigned NOT NULL default '0',
  `token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `short_label` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `full_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`item_type_history_id`),
  KEY `item_type_id` (`item_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_link_field_field` (
  `link_field_field_id` int(10) unsigned NOT NULL auto_increment,
  `root_field_id` int(10) unsigned NOT NULL default '0',
  `parent_field_id` int(10) unsigned NOT NULL default '0',
  `child_field_id` int(10) unsigned NOT NULL default '0',
  `depth_level` int(2) unsigned NOT NULL default '0',
  `sort_order` int(2) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`link_field_field_id`),
  UNIQUE KEY `root_field_id` (`root_field_id`,`parent_field_id`,`child_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_link_field_field_history` (
  `link_field_field_history_id` int(10) unsigned NOT NULL auto_increment,
  `link_field_field_id` int(10) unsigned NOT NULL default '0',
  `root_field_id` int(10) unsigned NOT NULL default '0',
  `parent_field_id` int(10) unsigned NOT NULL default '0',
  `child_field_id` int(10) unsigned NOT NULL default '0',
  `depth_level` int(2) unsigned NOT NULL default '0',
  `sort_order` int(2) unsigned NOT NULL default '0',
  `history_action` enum('Insert','Update','Delete') default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`link_field_field_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_link_field_item_item` (
  `link_field_item_item_id` int(10) unsigned NOT NULL auto_increment,
  `link_field_field_id` int(10) unsigned NOT NULL default '0',
  `parent_item_id` int(10) unsigned default '0',
  `child_item_id` int(10) unsigned default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`link_field_item_item_id`),
  UNIQUE KEY `link_dynamic_field_id` (`link_field_field_id`,`parent_item_id`,`child_item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_link_field_item_item_history` (
  `link_field_item_item_history_id` int(10) unsigned NOT NULL auto_increment,
  `link_field_item_item_id` int(10) unsigned NOT NULL default '0',
  `link_field_field_id` int(10) unsigned NOT NULL default '0',
  `parent_item_id` int(10) unsigned NOT NULL default '0',
  `child_item_id` int(10) unsigned NOT NULL default '0',
  `history_action` enum('Insert','Update','Delete') default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`link_field_item_item_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_response` (
  `response_id` int(10) unsigned NOT NULL auto_increment,
  `entry_id` int(10) unsigned NOT NULL default '0',
  `field_id` int(10) unsigned NOT NULL default '0',
  `item_id` int(10) unsigned NOT NULL default '0',
  `text` text CHARACTER SET utf8,
  `active_flag` int(1) unsigned default '1',
  `score` float unsigned default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`response_id`),
  KEY `entry_id` (`entry_id`),
  KEY `field_id` (`field_id`),
  KEY `item_id` (`item_id`),
  KEY `form_builder_response_i01` (`active_flag`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_response_attribute` (
  `response_attribute_id` int(10) unsigned NOT NULL auto_increment,
  `response_id` int(10) unsigned NOT NULL default '0',
  `attribute_id` int(10) unsigned NOT NULL default '0',
  `attribute_item_id` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`response_attribute_id`),
  KEY `response_id` (`response_id`),
  KEY `attribute_id` (`attribute_id`),
  KEY `attribute_item_id` (`attribute_item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_response_attribute_history` (
  `response_attribute_history_id` int(10) unsigned NOT NULL auto_increment,
  `response_attribute_id` int(10) unsigned NOT NULL default '0',
  `response_id` int(10) unsigned NOT NULL default '0',
  `attribute_id` int(10) unsigned NOT NULL default '0',
  `attribute_item_id` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`response_attribute_history_id`),
  KEY `response_attribute_id` (`response_attribute_id`),
  KEY `response_id` (`response_id`),
  KEY `attribute_id` (`attribute_id`),
  KEY `attribute_item_id` (`attribute_item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_response_history` (
  `response_history_id` int(10) unsigned NOT NULL auto_increment,
  `response_id` int(10) unsigned NOT NULL default '0',
  `entry_id` int(10) unsigned NOT NULL default '0',
  `field_id` int(10) unsigned NOT NULL default '0',
  `item_id` int(10) unsigned NOT NULL default '0',
  `text` text CHARACTER SET utf8,
  `active_flag` int(1) unsigned default '1',
  `score` float unsigned default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`response_history_id`),
  KEY `response_id` (`response_id`),
  KEY `entry_id` (`entry_id`),
  KEY `field_id` (`field_id`),
  KEY `item_id` (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_subject_assessor` (
  `subject_assessor_id` int(10) unsigned NOT NULL auto_increment,
  `form_id` int(10) unsigned NOT NULL,
  `time_period_id` int(10) unsigned NOT NULL,
  `subject_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `assessor_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `status` tinyint(2) NOT NULL default '1',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`subject_assessor_id`),
  UNIQUE KEY `form_id` (`form_id`,`time_period_id`,`subject_id`,`assessor_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `form_builder_subject_assessor_history` (
  `subject_assessor_history_id` int(10) unsigned NOT NULL auto_increment,
  `subject_assessor_id` int(10) unsigned NOT NULL,
  `form_id` int(10) unsigned NOT NULL,
  `time_period_id` int(10) unsigned NOT NULL,
  `subject_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `assessor_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `status` tinyint(3) NOT NULL default '1',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`subject_assessor_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `full_text_search_content` (
  `full_text_search_content_id` int(10) unsigned NOT NULL auto_increment,
  `content_id` int(10) unsigned NOT NULL default '0',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `copyright` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `authors` text CHARACTER SET utf8,
  `courses` text CHARACTER SET utf8,
  `keywords` text CHARACTER SET utf8,
  `school` enum('Default') default NULL,
  `type` enum('Document','Audio','Video','Flashpix','Collection','Figure','Slide','Shockwave','URL','PDF','Question','Multidocument','Quiz','DownloadableFile','Student Notes','Reuse','External','TUSKdoc') NOT NULL default 'Document',
  `body` text CHARACTER SET utf8,
  PRIMARY KEY  (`full_text_search_content_id`),
  KEY `content_id` (`content_id`),
  KEY `school` (`school`),
  KEY `type` (`type`),
  FULLTEXT KEY `title` (`title`,`body`,`copyright`,`authors`,`keywords`),
  FULLTEXT KEY `title_2` (`title`),
  FULLTEXT KEY `body` (`body`),
  FULLTEXT KEY `copyright` (`copyright`),
  FULLTEXT KEY `authors` (`authors`),
  FULLTEXT KEY `keywords` (`keywords`),
  FULLTEXT KEY `courses` (`courses`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `grade_offering` (
  `grade_offering_id` int(10) unsigned NOT NULL auto_increment,
  `course_id` int(10) unsigned NOT NULL,
  `time_period_id` int(10) unsigned NOT NULL,
  `root_grade_category_id` int(10) unsigned NOT NULL,
  `final_grade_event_id` int(10) unsigned default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`grade_offering_id`),
  UNIQUE KEY `course_id` (`course_id`,`time_period_id`),
  KEY `root_grade_category_id` (`root_grade_category_id`),
  KEY `final_grade_event_id` (`final_grade_event_id`),
  CONSTRAINT `grade_offering_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `grade_category` (
  `grade_category_id` int(10) unsigned NOT NULL auto_increment,
  `grade_offering_id` int(10) unsigned NOT NULL,
  `grade_category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_grade_category_id` int(10) unsigned default NULL,
  `depth` tinyint(3) unsigned default '0',
  `sort_order` tinyint(3) unsigned default '0',
  `lineage` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `drop_lowest` tinyint(3) unsigned default '0',
  `drop_highest` tinyint(3) unsigned default '0',
  `multi_site` tinyint(1) default '0',
  `category_weight` int(10) unsigned default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`grade_category_id`),
  KEY `grade_offering_id` (`grade_offering_id`),
  KEY `parent_grade_category_id` (`parent_grade_category_id`),
  CONSTRAINT `grade_category_ibfk_1` FOREIGN KEY (`grade_offering_id`) REFERENCES `grade_offering` (`grade_offering_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `grade_category_coding_code` (
  `grade_category_coding_code_id` int(10) unsigned NOT NULL auto_increment,
  `grade_category_id` int(10) unsigned NOT NULL,
  `coding_code_id` int(10) unsigned NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`grade_category_coding_code_id`),
  KEY `grade_category_id` (`grade_category_id`),
  KEY `coding_code_id` (`coding_code_id`),
  CONSTRAINT `grade_category_coding_code_ibfk_1` FOREIGN KEY (`grade_category_id`) REFERENCES `grade_category` (`grade_category_id`),
  CONSTRAINT `grade_category_coding_code_ibfk_2` FOREIGN KEY (`coding_code_id`) REFERENCES `coding_code` (`coding_code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `grade_category_coding_code_history` (
  `grade_category_coding_code_history_id` int(10) unsigned NOT NULL auto_increment,
  `grade_category_coding_code_id` int(10) unsigned NOT NULL,
  `grade_category_id` int(10) unsigned NOT NULL,
  `coding_code_id` int(10) unsigned NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`grade_category_coding_code_history_id`),
  KEY `grade_category_id` (`grade_category_id`),
  KEY `coding_code_id` (`coding_code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `grade_category_history` (
  `grade_category_history_id` int(10) unsigned NOT NULL auto_increment,
  `grade_category_id` int(10) unsigned NOT NULL,
  `grade_offering_id` int(10) unsigned NOT NULL,
  `grade_category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_grade_category_id` int(10) unsigned default NULL,
  `depth` tinyint(3) unsigned default '0',
  `sort_order` tinyint(3) unsigned default '0',
  `lineage` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `drop_lowest` tinyint(3) unsigned default '0',
  `drop_highest` tinyint(3) unsigned default '0',
  `multi_site` tinyint(1) default '0',
  `category_weight` int(10) unsigned default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`grade_category_history_id`),
  KEY `grade_category_id` (`grade_category_id`),
  KEY `grade_offering_id` (`grade_offering_id`),
  KEY `parent_grade_category_id` (`parent_grade_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `grade_event` (
  `grade_event_id` int(10) unsigned NOT NULL auto_increment,
  `school_id` int(10) unsigned NOT NULL default '0',
  `course_id` int(10) unsigned NOT NULL default '0',
  `time_period_id` int(10) unsigned NOT NULL default '0',
  `grade_event_type_id` int(10) unsigned NOT NULL default '0',
  `event_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `weight` float default NULL,
  `event_description` text CHARACTER SET utf8,
  `publish_flag` int(1) unsigned NOT NULL default '0',
  `quiz_id` int(10) unsigned default NULL,
  `grade_category_id` int(10) unsigned NOT NULL,
  `sort_order` smallint(6) NOT NULL default '32767',
  `group_flag` int(1) unsigned default '0',
  `waive_grade` int(1) unsigned default NULL,
  `due_date` datetime default NULL,
  `pass_grade` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `max_possible_points` int(10) default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`grade_event_id`),
  KEY `grade_event_i01` (`school_id`),
  KEY `grade_event_i02` (`course_id`),
  KEY `grade_event_i03` (`time_period_id`),
  KEY `grade_event_i04` (`grade_event_type_id`),
  KEY `grade_category_id` (`grade_category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `grade_event_eval` (
  `grade_event_eval_id` int(10) unsigned NOT NULL auto_increment,
  `grade_event_id` int(10) unsigned NOT NULL,
  `eval_id` int(10) unsigned default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`grade_event_eval_id`),
  KEY `grade_event_id` (`grade_event_id`),
  KEY `eval_id` (`eval_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `grade_event_eval_history` (
  `grade_event_eval_history_id` int(10) unsigned NOT NULL auto_increment,
  `grade_event_eval_id` int(10) unsigned NOT NULL,
  `grade_event_id` int(10) unsigned NOT NULL,
  `eval_id` int(10) unsigned default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`grade_event_eval_history_id`),
  KEY `grade_event_eval_id` (`grade_event_eval_id`),
  KEY `grade_event_id` (`grade_event_id`),
  KEY `eval_id` (`eval_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `grade_event_grade_scale` (
  `grade_event_grade_scale_id` int(10) NOT NULL auto_increment,
  `grade_scale_id` int(10) unsigned NOT NULL,
  `grade_event_id` int(10) unsigned NOT NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_on` datetime default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`grade_event_grade_scale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `grade_event_history` (
  `grade_event_history_id` int(10) unsigned NOT NULL auto_increment,
  `grade_event_id` int(10) unsigned NOT NULL default '0',
  `school_id` int(10) unsigned NOT NULL default '0',
  `course_id` int(10) unsigned NOT NULL default '0',
  `time_period_id` int(10) unsigned NOT NULL default '0',
  `grade_event_type_id` int(10) unsigned NOT NULL default '0',
  `event_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `weight` int(10) unsigned default NULL,
  `event_description` text CHARACTER SET utf8,
  `publish_flag` int(1) unsigned NOT NULL default '0',
  `quiz_id` int(10) unsigned default NULL,
  `grade_category_id` int(10) unsigned NOT NULL,
  `sort_order` smallint(6) unsigned NOT NULL default '65535',
  `group_flag` int(1) unsigned default '0',
  `waive_grade` int(1) unsigned default NULL,
  `due_date` datetime default NULL,
  `pass_grade` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `max_possible_points` int(10) default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') NOT NULL default 'Insert',
  PRIMARY KEY  (`grade_event_history_id`),
  KEY `grade_event_history_i01` (`school_id`),
  KEY `grade_event_history_i02` (`course_id`),
  KEY `grade_event_history_i03` (`time_period_id`),
  KEY `grade_event_history_i04` (`grade_event_type_id`),
  KEY `grade_event_history_i05` (`grade_event_id`),
  KEY `grade_category_id` (`grade_category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `grade_event_type` (
  `grade_event_type_id` int(10) unsigned NOT NULL auto_increment,
  `grade_event_type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`grade_event_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
INSERT INTO `grade_event_type` VALUES (1,'Quiz','bkessler','2005-01-25 06:06:58','bkessler','2005-01-25 06:06:58'),(2,'Exam','bkessler','2005-01-25 06:06:58','bkessler','2005-01-25 06:06:58'),(3,'Assignment','bkessler','2005-01-25 06:06:58','bkessler','2005-01-25 06:06:58'),(4,'Paper','bkessler','2005-01-25 06:06:58','bkessler','2005-01-25 06:06:58'),(5,'Project','bkessler','2005-01-25 06:06:58','bkessler','2005-01-25 06:06:58'),(6,'Final Grade','bkessler','2005-01-25 06:06:58','bkessler','2005-01-25 06:06:58'),(7,'Case','dwalke01','2006-10-16 06:01:59','dwalke01','2006-10-16 06:01:59');

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `grade_event_type_history` (
  `grade_event_type_history_id` int(10) unsigned NOT NULL auto_increment,
  `grade_event_type_id` int(10) unsigned NOT NULL default '0',
  `grade_event_type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') NOT NULL default 'Insert',
  PRIMARY KEY  (`grade_event_type_history_id`),
  KEY `grade_event_type_history_i01` (`grade_event_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `grade_multiple` (
  `grade_multiple_id` int(10) unsigned NOT NULL auto_increment,
  `link_user_grade_event_id` int(10) unsigned NOT NULL,
  `grade` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `grade_date` datetime default NULL,
  `grade_type` tinyint(1) default '0',
  `sort_order` tinyint(2) default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`grade_multiple_id`),
  KEY `link_user_grade_event_id` (`link_user_grade_event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `grade_multiple_history` (
  `grade_multiple_history_id` int(10) unsigned NOT NULL auto_increment,
  `grade_multiple_id` int(10) unsigned NOT NULL,
  `link_user_grade_event_id` int(10) unsigned NOT NULL,
  `grade` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `grade_date` datetime default NULL,
  `grade_type` tinyint(1) default '0',
  `sort_order` tinyint(2) default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`grade_multiple_history_id`),
  KEY `link_user_grade_event_id` (`link_user_grade_event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `grade_offering_history` (
  `grade_offering_history_id` int(10) unsigned NOT NULL auto_increment,
  `grade_offering_id` int(10) unsigned NOT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `time_period_id` int(10) unsigned NOT NULL,
  `root_grade_category_id` int(10) unsigned NOT NULL,
  `final_grade_event_id` int(10) unsigned default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') NOT NULL default 'Insert',
  PRIMARY KEY  (`grade_offering_history_id`),
  KEY `course_id` (`course_id`),
  KEY `time_period_id` (`time_period_id`),
  KEY `root_grade_category_id` (`root_grade_category_id`),
  KEY `final_grade_event_id` (`final_grade_event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `grade_scale` (
  `grade_scale_id` int(10) NOT NULL auto_increment,
  `name` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_on` datetime default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`grade_scale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `grade_scale_bounds` (
  `grade_scale_bounds_id` int(10) NOT NULL auto_increment,
  `grade_scale_id` int(10) unsigned NOT NULL,
  `grade_symbol` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lower_bound` int(10) unsigned NOT NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_on` datetime default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`grade_scale_bounds_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `grade_scale_course` (
  `grade_scale_course_id` int(10) NOT NULL auto_increment,
  `grade_scale_id` int(10) unsigned NOT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `school_id` int(10) unsigned NOT NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_on` datetime default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`grade_scale_course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `grade_scale_type` (
  `grade_scale_type_id` int(10) unsigned NOT NULL auto_increment,
  `grade_scale_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_on` datetime default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`grade_scale_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
INSERT INTO `grade_scale_type` VALUES (1,'standard','scorde01','2009-03-01 00:00:00','scorde01','2009-03-01 00:00:00'),(2,'percentage','scorde01','2009-03-01 00:00:00','scorde01','2009-03-01 00:00:00'),(3,'none','scorde01','2009-03-01 00:00:00','scorde01','2009-03-01 00:00:00'),(4,'custom','scorde01','2009-03-01 00:00:00','scorde01','2009-03-01 00:00:00');

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `group_content` (
  `group_content_id` int(10) unsigned NOT NULL auto_increment,
  `user_group_id` int(10) unsigned NOT NULL default '0',
  `group_content_type_id` int(10) unsigned NOT NULL default '0',
  `body` text CHARACTER SET utf8,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`group_content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `group_content_history` (
  `group_content_history_id` int(10) unsigned NOT NULL auto_increment,
  `group_content_id` int(10) NOT NULL default '0',
  `user_group_id` int(10) unsigned NOT NULL default '0',
  `group_content_type_id` int(10) unsigned NOT NULL default '0',
  `body` text CHARACTER SET utf8,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`group_content_history_id`),
  KEY `group_content_id` (`group_content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `history_phase_question` (
  `history_phase_question_id` int(10) unsigned NOT NULL auto_increment,
  `phase_id` int(10) unsigned NOT NULL default '0',
  `question` text CHARACTER SET utf8,
  `answer` text CHARACTER SET utf8,
  `sort_order` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`history_phase_question_id`),
  KEY `history_phase_question_i01` (`phase_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `history_phase_question_history` (
  `history_phase_question_history_id` int(10) unsigned NOT NULL auto_increment,
  `history_phase_question_id` int(10) unsigned NOT NULL default '0',
  `phase_id` int(10) unsigned NOT NULL default '0',
  `question` text CHARACTER SET utf8,
  `answer` text CHARACTER SET utf8,
  `sort_order` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`history_phase_question_history_id`),
  KEY `history_phase_question_history_i01` (`phase_id`),
  KEY `history_phase_question_history_i02` (`history_phase_question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `homepage_exclusion` (
  `homepage_exclusion_id` int(10) unsigned NOT NULL auto_increment,
  `user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `section_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  PRIMARY KEY  (`homepage_exclusion_id`),
  UNIQUE KEY `exclusion_u01` (`user_id`,`section_token`),
  KEY `user` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `homepage_section` (
  `homepage_section_id` int(10) unsigned NOT NULL auto_increment,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `display_column` enum('Major','Minor') NOT NULL default 'Minor',
  `sort_order` int(10) unsigned default '0',
  `display` tinyint(1) unsigned NOT NULL default '1',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`homepage_section_id`),
  KEY `token` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
INSERT INTO `homepage_section` VALUES (1,'schedule','today\'s schedule','Major',10,1,'dwalke01','2008-12-22 11:42:21','dwalke01','2008-12-22 11:42:21'),(2,'courses','courses','Major',20,1,'dwalke01','2008-12-22 11:42:21','dwalke01','2008-12-22 11:42:21'),(3,'admin_committees','course admin and committees','Major',30,1,'dwalke01','2008-12-22 11:42:21','dwalke01','2008-12-22 11:42:21'),(4,'school_courses','all courses for:','Major',40,1,'dwalke01','2008-12-22 11:42:21','dwalke01','2008-12-22 11:42:21'),(5,'discussions','my discussions','Minor',20,1,'dwalke01','2008-12-22 11:42:21','dwalke01','2008-12-22 11:42:21'),(6,'my_groups','my groups','Minor',30,1,'dwalke01','2008-12-22 11:42:21','dwalke01','2008-12-22 11:42:21'),(7,'recently_viewed','my recently viewed','Minor',40,1,'dwalke01','2008-12-22 11:42:21','dwalke01','2008-12-22 11:42:21'),(8,'pop_content','popular content','Minor',50,1,'dwalke01','2008-12-22 11:42:21','dwalke01','2008-12-22 11:42:21'),(10,'school_links','school links','Minor',10,1,'dwalke01','2009-06-23 13:50:44','dwalke01','2009-06-23 13:50:37');

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `homepage_section_history` (
  `homepage_section_history_id` int(10) unsigned NOT NULL auto_increment,
  `homepage_section_id` int(10) unsigned NOT NULL default '0',
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `display_column` enum('Major','Minor') NOT NULL default 'Minor',
  `sort_order` int(10) unsigned default '0',
  `display` tinyint(1) unsigned NOT NULL default '1',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`homepage_section_history_id`),
  KEY `homepage_section_id` (`homepage_section_id`),
  KEY `token` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `integrated_course_quiz_question` (
  `integrated_course_quiz_question_id` int(10) NOT NULL auto_increment,
  `parent_integrated_course_id` int(10) NOT NULL default '0',
  `child_quiz_question_id` int(10) NOT NULL default '0',
  `originating_course_id` int(10) NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_on` datetime default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`integrated_course_quiz_question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `keyword` (
  `keyword_id` int(11) NOT NULL auto_increment,
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `concept_id` varchar(8) character set utf8 default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`keyword_id`),
  KEY `keyword_i01` (`concept_id`),
  KEY `keyword_i02` (`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `keyword_history` (
  `keyword_history_id` int(10) unsigned NOT NULL auto_increment,
  `keyword_id` int(11) NOT NULL default '0',
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `concept_id` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `definition` text CHARACTER SET utf8,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`keyword_history_id`),
  KEY `keyword_history_i01` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_assignment_content` (
  `link_assignment_content_id` int(10) unsigned NOT NULL auto_increment,
  `parent_assignment_id` int(10) unsigned NOT NULL default '0',
  `child_content_id` int(10) unsigned NOT NULL default '0',
  `user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `user_group_id` int(10) unsigned NOT NULL default '0',
  `submit_sequence` int(1) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`link_assignment_content_id`),
  KEY `parent_assignment_id` (`parent_assignment_id`),
  KEY `child_content_id` (`child_content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_assignment_content_history` (
  `link_assignment_content_history_id` int(10) unsigned NOT NULL auto_increment,
  `link_assignment_content_id` int(10) unsigned NOT NULL default '0',
  `parent_assignment_id` int(10) unsigned NOT NULL default '0',
  `child_content_id` int(10) unsigned NOT NULL default '0',
  `user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `user_group_id` int(10) unsigned NOT NULL default '0',
  `submit_sequence` int(1) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`link_assignment_content_history_id`),
  KEY `link_assignment_content_id` (`link_assignment_content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_assignment_student` (
  `link_assignment_student_id` int(10) unsigned NOT NULL auto_increment,
  `parent_assignment_id` int(10) unsigned NOT NULL default '0',
  `child_user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `resubmit_flag` int(1) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`link_assignment_student_id`),
  KEY `parent_assignment_id` (`parent_assignment_id`),
  KEY `child_user_id` (`child_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_assignment_student_history` (
  `link_assignment_student_history_id` int(10) unsigned NOT NULL auto_increment,
  `link_assignment_student_id` int(10) unsigned NOT NULL default '0',
  `parent_assignment_id` int(10) unsigned NOT NULL default '0',
  `child_user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `resubmit_flag` int(1) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`link_assignment_student_history_id`),
  KEY `link_assignment_student_id` (`link_assignment_student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_assignment_user` (
  `link_assignment_user_id` int(10) unsigned NOT NULL auto_increment,
  `parent_assignment_id` int(10) unsigned NOT NULL default '0',
  `child_user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`link_assignment_user_id`),
  KEY `parent_assignment_id` (`parent_assignment_id`),
  KEY `child_user_id` (`child_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_assignment_user_group` (
  `link_assignment_user_group_id` int(10) unsigned NOT NULL auto_increment,
  `parent_assignment_id` int(10) unsigned NOT NULL default '0',
  `child_user_group_id` int(10) unsigned NOT NULL default '0',
  `resubmit_flag` int(1) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`link_assignment_user_group_id`),
  KEY `parent_assignment_id` (`parent_assignment_id`),
  KEY `child_user_group_id` (`child_user_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_assignment_user_group_history` (
  `link_assignment_user_group_history_id` int(10) unsigned NOT NULL auto_increment,
  `link_assignment_user_group_id` int(10) unsigned NOT NULL default '0',
  `parent_assignment_id` int(10) unsigned NOT NULL default '0',
  `child_user_group_id` int(10) unsigned NOT NULL default '0',
  `resubmit_flag` int(1) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`link_assignment_user_group_history_id`),
  KEY `link_assignment_user_group_id` (`link_assignment_user_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_assignment_user_history` (
  `link_assignment_user_history_id` int(10) unsigned NOT NULL auto_increment,
  `link_assignment_user_id` int(10) unsigned NOT NULL default '0',
  `parent_assignment_id` int(10) unsigned NOT NULL default '0',
  `child_user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`link_assignment_user_history_id`),
  KEY `link_assignment_user_id` (`link_assignment_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_case_content` (
  `link_case_content_id` int(10) unsigned NOT NULL auto_increment,
  `parent_case_id` int(10) unsigned NOT NULL default '0',
  `child_content_id` int(10) unsigned NOT NULL default '0',
  `link_type` enum('Reference') NOT NULL default 'Reference',
  `sort_order` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`link_case_content_id`),
  UNIQUE KEY `link_case_content_u01` (`parent_case_id`,`child_content_id`,`link_type`),
  KEY `link_case_content_i01` (`parent_case_id`),
  KEY `link_case_content_i02` (`child_content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_case_content_history` (
  `link_case_content_history_id` int(10) unsigned NOT NULL auto_increment,
  `link_case_content_id` int(10) unsigned NOT NULL default '0',
  `parent_case_id` int(10) unsigned NOT NULL default '0',
  `child_content_id` int(10) unsigned NOT NULL default '0',
  `link_type` enum('Reference') NOT NULL default 'Reference',
  `sort_order` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`link_case_content_history_id`),
  KEY `link_case_content_history_i01` (`parent_case_id`),
  KEY `link_case_content_history_i02` (`child_content_id`),
  KEY `link_case_content_history_i03` (`link_case_content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_case_grade_event` (
  `link_case_grade_event_id` int(10) unsigned NOT NULL auto_increment,
  `parent_case_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `child_grade_event_id` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`link_case_grade_event_id`),
  UNIQUE KEY `link_case_grade_event_u01` (`parent_case_id`,`child_grade_event_id`),
  KEY `link_case_grade_event_i01` (`parent_case_id`),
  KEY `link_case_grade_event_i02` (`child_grade_event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_case_grade_event_history` (
  `link_case_grade_event_history_id` int(10) unsigned NOT NULL auto_increment,
  `link_case_grade_event_id` int(10) unsigned NOT NULL default '0',
  `parent_case_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `child_grade_event_id` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`link_case_grade_event_history_id`),
  KEY `link_case_grade_event_id` (`link_case_grade_event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_case_keyword` (
  `link_case_keyword_id` int(10) unsigned NOT NULL auto_increment,
  `parent_case_id` int(10) unsigned NOT NULL default '0',
  `child_keyword_id` int(10) unsigned NOT NULL default '0',
  `sort_order` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`link_case_keyword_id`),
  UNIQUE KEY `link_case_keyword_u01` (`parent_case_id`,`child_keyword_id`),
  KEY `link_case_keyword_i01` (`parent_case_id`),
  KEY `link_case_keyword_i02` (`child_keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_case_keyword_history` (
  `link_case_keyword_history_id` int(10) unsigned NOT NULL auto_increment,
  `link_case_keyword_id` int(10) unsigned NOT NULL default '0',
  `parent_case_id` int(10) unsigned NOT NULL default '0',
  `child_keyword_id` int(10) unsigned NOT NULL default '0',
  `sort_order` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`link_case_keyword_history_id`),
  KEY `link_case_keyword_history_i01` (`link_case_keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_case_objective` (
  `link_case_objective_id` int(10) unsigned NOT NULL auto_increment,
  `parent_case_id` int(10) unsigned NOT NULL default '0',
  `child_objective_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `sort_order` int(11) NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`link_case_objective_id`),
  UNIQUE KEY `link_case_objective_u03` (`parent_case_id`,`child_objective_id`),
  KEY `link_case_objective_i01` (`parent_case_id`),
  KEY `link_case_objective_i02` (`child_objective_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_case_objective_history` (
  `link_case_objective_history_id` int(10) unsigned NOT NULL auto_increment,
  `link_case_objective_id` int(10) unsigned NOT NULL default '0',
  `parent_case_id` int(10) unsigned NOT NULL default '0',
  `child_objective_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `sort_order` int(11) NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`link_case_objective_history_id`),
  KEY `link_case_objective_history_i01` (`parent_case_id`),
  KEY `link_case_objective_history_i02` (`child_objective_id`),
  KEY `link_case_objective_history_i03` (`link_case_objective_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_case_phase` (
  `link_case_phase_id` int(10) unsigned NOT NULL auto_increment,
  `parent_case_id` int(10) unsigned NOT NULL default '0',
  `child_phase_id` int(10) unsigned NOT NULL default '0',
  `sort_order` int(10) unsigned NOT NULL default '0',
  `phase_hidden` tinyint(1) NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`link_case_phase_id`),
  UNIQUE KEY `link_case_phase_u03` (`parent_case_id`,`child_phase_id`),
  KEY `link_case_phase_i01` (`parent_case_id`),
  KEY `link_case_phase_i02` (`child_phase_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_case_phase_history` (
  `link_case_phase_history_id` int(10) unsigned NOT NULL auto_increment,
  `link_case_phase_id` int(10) unsigned NOT NULL default '0',
  `parent_case_id` int(10) unsigned NOT NULL default '0',
  `child_phase_id` int(10) unsigned NOT NULL default '0',
  `sort_order` int(10) unsigned NOT NULL default '0',
  `phase_hidden` tinyint(1) NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`link_case_phase_history_id`),
  KEY `link_case_phase_history_i01` (`parent_case_id`),
  KEY `link_case_phase_history_i02` (`child_phase_id`),
  KEY `link_case_phase_history_i03` (`link_case_phase_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_case_report_quiz_result` (
  `link_case_report_quiz_result_id` int(10) unsigned NOT NULL auto_increment,
  `parent_case_report_id` int(10) unsigned NOT NULL default '0',
  `child_quiz_result_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `phase_visit_id` int(10) unsigned default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`link_case_report_quiz_result_id`),
  UNIQUE KEY `link_case_report_quiz_result_u01` (`parent_case_report_id`,`child_quiz_result_id`),
  KEY `link_case_report_quiz_result_i01` (`parent_case_report_id`),
  KEY `link_case_report_quiz_result_i02` (`child_quiz_result_id`),
  KEY `phase_visit_id` (`phase_visit_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_case_report_quiz_result_history` (
  `link_case_report_quiz_result_history_id` int(10) unsigned NOT NULL auto_increment,
  `link_case_report_quiz_result_id` int(10) unsigned NOT NULL default '0',
  `parent_case_report_id` int(10) unsigned NOT NULL default '0',
  `child_quiz_result_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `phase_visit_id` int(10) unsigned default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`link_case_report_quiz_result_history_id`),
  KEY `link_case_report_quiz_result_history_i01` (`link_case_report_quiz_result_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_content_keyword` (
  `link_content_keyword_id` int(11) NOT NULL auto_increment,
  `parent_content_id` int(11) NOT NULL default '0',
  `child_keyword_id` int(11) NOT NULL default '0',
  `sort_order` int(11) NOT NULL default '0',
  `author_weight` tinyint(4) default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`link_content_keyword_id`),
  UNIQUE KEY `link_content_keyword_u01` (`parent_content_id`,`child_keyword_id`),
  KEY `link_content_keyword_i01` (`child_keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_content_keyword_history` (
  `link_content_keyword_history_id` int(10) unsigned NOT NULL auto_increment,
  `link_content_keyword_id` int(11) NOT NULL default '0',
  `parent_content_id` int(10) NOT NULL default '0',
  `child_keyword_id` int(10) NOT NULL default '0',
  `sort_order` int(11) NOT NULL default '0',
  `computed_weight` float default NULL,
  `author_weight` tinyint(4) default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`link_content_keyword_history_id`),
  KEY `link_content_keyword_history_i01` (`link_content_keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_course_case` (
  `link_course_case_id` int(10) unsigned NOT NULL auto_increment,
  `parent_course_id` int(10) unsigned NOT NULL default '0',
  `child_case_id` int(10) unsigned NOT NULL default '0',
  `school_id` int(10) unsigned NOT NULL default '0',
  `available_date` datetime default NULL,
  `due_date` datetime default NULL,
  `sort_order` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`link_course_case_id`),
  UNIQUE KEY `link_course_case_u04` (`parent_course_id`,`child_case_id`,`school_id`),
  KEY `link_course_case_i01` (`parent_course_id`),
  KEY `link_course_case_i02` (`child_case_id`),
  KEY `link_course_case_i03` (`school_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_course_case_history` (
  `link_course_case_history_id` int(10) unsigned NOT NULL auto_increment,
  `link_course_case_id` int(10) unsigned NOT NULL default '0',
  `parent_course_id` int(10) unsigned NOT NULL default '0',
  `child_case_id` int(10) unsigned NOT NULL default '0',
  `school_id` int(10) unsigned NOT NULL default '0',
  `available_date` datetime default NULL,
  `due_date` datetime default NULL,
  `sort_order` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`link_course_case_history_id`),
  KEY `link_course_case_history_i01` (`link_course_case_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_course_course` (
  `link_course_course_id` int(10) unsigned NOT NULL auto_increment,
  `parent_course_id` int(10) unsigned NOT NULL,
  `child_course_id` int(10) unsigned NOT NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`link_course_course_id`),
  KEY `parent_course_id` (`parent_course_id`),
  KEY `child_course_id` (`child_course_id`),
  CONSTRAINT `link_course_course_ibfk_1` FOREIGN KEY (`parent_course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `link_course_course_ibfk_2` FOREIGN KEY (`child_course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_course_course_history` (
  `link_course_course_history_id` int(10) unsigned NOT NULL auto_increment,
  `link_course_course_id` int(10) unsigned NOT NULL,
  `parent_course_id` int(10) unsigned NOT NULL,
  `child_course_id` int(10) unsigned NOT NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`link_course_course_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_course_custom_scale` (
  `link_course_custom_scale_id` int(10) unsigned NOT NULL auto_increment,
  `course_id` int(10) unsigned NOT NULL default '0',
  `lower_bound` float default NULL,
  `grade` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_on` datetime default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`link_course_custom_scale_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_course_custom_scale_history` (
  `link_course_custom_scale_history_id` int(10) unsigned NOT NULL auto_increment,
  `link_course_custom_scale_id` int(10) unsigned NOT NULL default '0',
  `course_id` int(10) unsigned NOT NULL default '0',
  `lower_bound` int(10) default NULL,
  `grade` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_on` datetime default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`link_course_custom_scale_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_course_form` (
  `link_course_form_id` int(10) unsigned NOT NULL auto_increment,
  `parent_course_id` int(10) unsigned NOT NULL default '0',
  `child_form_id` int(10) unsigned NOT NULL default '0',
  `school_id` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`link_course_form_id`),
  KEY `parent_course_id` (`parent_course_id`),
  KEY `child_form_id` (`child_form_id`),
  KEY `school_id` (`school_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_course_form_history` (
  `link_course_form_history_id` int(10) unsigned NOT NULL auto_increment,
  `link_course_form_id` int(10) unsigned NOT NULL default '0',
  `parent_course_id` int(10) unsigned NOT NULL default '0',
  `child_form_id` int(10) unsigned NOT NULL default '0',
  `school_id` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`link_course_form_history_id`),
  KEY `link_course_form_id` (`link_course_form_id`),
  KEY `parent_course_id` (`parent_course_id`),
  KEY `child_form_id` (`child_form_id`),
  KEY `school_id` (`school_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_course_grade_event_type` (
  `link_course_grade_event_type_id` int(10) unsigned NOT NULL auto_increment,
  `drop_lowest` int(1) default '0',
  `drop_highest` int(1) default '0',
  `total_weight` int(4) default '0',
  `grade_event_type_id` int(10) unsigned NOT NULL default '0',
  `course_id` int(10) unsigned NOT NULL default '0',
  `time_period_id` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_on` datetime default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`link_course_grade_event_type_id`),
  UNIQUE KEY `course_id` (`course_id`,`grade_event_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_course_grade_event_type_history` (
  `link_course_grade_event_type_history_id` int(10) unsigned NOT NULL auto_increment,
  `link_course_grade_event_type_id` int(10) unsigned NOT NULL default '0',
  `drop_lowest` int(1) default '0',
  `drop_highest` int(1) default '0',
  `total_weight` int(4) default '0',
  `grade_event_type_id` int(10) unsigned NOT NULL default '0',
  `course_id` int(10) unsigned NOT NULL default '0',
  `time_period_id` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_on` datetime default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`link_course_grade_event_type_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_course_grade_scale` (
  `link_course_grade_scale_id` int(10) unsigned NOT NULL auto_increment,
  `course_id` int(10) unsigned NOT NULL default '0',
  `grade_scale_type_id` int(10) unsigned NOT NULL default '0',
  `time_period_id` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_on` datetime default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`link_course_grade_scale_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_course_grade_scale_history` (
  `link_course_grade_scale_id_history` int(10) unsigned NOT NULL auto_increment,
  `link_course_grade_scale_id` int(10) unsigned NOT NULL default '0',
  `course_id` int(10) unsigned NOT NULL default '0',
  `grade_scale_type_id` int(10) unsigned NOT NULL default '0',
  `time_period_id` int(10) unsigned NOT NULL default '0',
  `history_action` enum('Insert','Update','Delete') default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_on` datetime default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`link_course_grade_scale_id_history`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_course_quiz` (
  `link_course_quiz_id` int(10) unsigned NOT NULL auto_increment,
  `parent_course_id` int(10) unsigned NOT NULL default '0',
  `child_quiz_id` int(10) unsigned NOT NULL default '0',
  `school_id` int(10) unsigned NOT NULL default '0',
  `time_period_id` int(10) unsigned NOT NULL default '0',
  `available_date` datetime default NULL,
  `due_date` datetime default NULL,
  `sort_order` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`link_course_quiz_id`),
  UNIQUE KEY `link_course_quiz_u04` (`parent_course_id`,`child_quiz_id`),
  KEY `link_course_quiz_i01` (`parent_course_id`),
  KEY `link_course_quiz_i02` (`child_quiz_id`),
  KEY `link_course_quiz_i03` (`school_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_course_quiz_history` (
  `link_course_quiz_history_id` int(10) unsigned NOT NULL auto_increment,
  `link_course_quiz_id` int(10) unsigned NOT NULL default '0',
  `parent_course_id` int(10) unsigned NOT NULL default '0',
  `child_quiz_id` int(10) unsigned NOT NULL default '0',
  `school_id` int(10) unsigned NOT NULL default '0',
  `time_period_id` int(10) unsigned NOT NULL default '0',
  `available_date` datetime default NULL,
  `due_date` datetime default NULL,
  `sort_order` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `history_action` enum('Insert','Update','Delete') NOT NULL default 'Insert',
  PRIMARY KEY  (`link_course_quiz_history_id`),
  KEY `link_course_quiz_history_i01` (`parent_course_id`),
  KEY `link_course_quiz_history_i02` (`child_quiz_id`),
  KEY `link_course_quiz_history_i03` (`school_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_course_student_history` (
  `link_course_student_history_id` int(10) unsigned NOT NULL auto_increment,
  `school_id` int(10) NOT NULL default '0',
  `parent_course_id` int(10) unsigned NOT NULL default '0',
  `child_user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `time_period_id` int(10) unsigned NOT NULL default '0',
  `teaching_site_id` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default 'Insert',
  PRIMARY KEY  (`link_course_student_history_id`),
  KEY `school_id` (`school_id`),
  KEY `course_id` (`parent_course_id`),
  KEY `user_id` (`child_user_id`),
  KEY `teaching_site_id` (`teaching_site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_course_user_history` (
  `link_course_user_history_id` int(10) unsigned NOT NULL auto_increment,
  `school_id` int(10) NOT NULL default '0',
  `parent_course_id` int(10) unsigned NOT NULL default '0',
  `child_user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `sort_order` smallint(6) unsigned default NULL,
  `roles` set('Director','Manager','Student Manager','Site Director','Editor','Author','Student Editor','Lecturer','Instructor','Lab Instructor','Librarian','MERC Representative','Teaching Assistant') default NULL,
  `teaching_site_id` int(10) unsigned default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default 'Insert',
  PRIMARY KEY  (`link_course_user_history_id`),
  KEY `school_id` (`school_id`),
  KEY `course_id` (`parent_course_id`),
  KEY `user_id` (`child_user_id`),
  KEY `teaching_site_id` (`teaching_site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_form_field` (
  `link_form_field_id` int(10) unsigned NOT NULL auto_increment,
  `parent_form_id` int(10) unsigned NOT NULL default '0',
  `child_field_id` int(10) unsigned NOT NULL default '0',
  `sort_order` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`link_form_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_form_field_history` (
  `link_form_field_history_id` int(10) unsigned NOT NULL auto_increment,
  `link_form_field_id` int(10) unsigned NOT NULL default '0',
  `parent_form_id` int(10) unsigned NOT NULL default '0',
  `child_field_id` int(10) unsigned NOT NULL default '0',
  `sort_order` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`link_form_field_history_id`),
  KEY `link_form_field_id` (`link_form_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_grade_event_grade_scale` (
  `link_grade_event_grade_scale_id` int(10) unsigned NOT NULL auto_increment,
  `grade_event_id` int(10) unsigned default '0',
  `numeric_value` float default NULL,
  `symbolic_value` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_on` datetime default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`link_grade_event_grade_scale_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_grade_event_grade_scale_history` (
  `link_grade_event_grade_scale_history_id` int(10) unsigned NOT NULL auto_increment,
  `link_grade_event_grade_scale_id` int(10) unsigned NOT NULL default '0',
  `grade_event_id` int(10) unsigned default '0',
  `numeric_value` int(10) default NULL,
  `symbolic_value` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_on` datetime default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`link_grade_event_grade_scale_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_integrated_course_content` (
  `link_integrated_course_content_id` int(10) unsigned NOT NULL auto_increment,
  `parent_integrated_course_id` int(10) unsigned NOT NULL default '0',
  `child_content_id` int(10) unsigned NOT NULL default '0',
  `originating_course_id` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`link_integrated_course_content_id`),
  KEY `parent_integrated_course_id` (`parent_integrated_course_id`),
  KEY `child_content_id` (`child_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_integrated_course_content_history` (
  `link_integrated_course_content_history_id` int(10) unsigned NOT NULL auto_increment,
  `link_integrated_course_content_id` int(10) unsigned NOT NULL default '0',
  `parent_integrated_course_id` int(10) unsigned NOT NULL default '0',
  `child_content_id` int(10) unsigned NOT NULL default '0',
  `originating_course_id` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`link_integrated_course_content_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_keyword_keyword` (
  `link_keyword_keyword_id` int(10) unsigned NOT NULL auto_increment,
  `parent_keyword_id` int(10) NOT NULL default '0',
  `child_keyword_id` int(10) NOT NULL default '0',
  `concept_relationship` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  PRIMARY KEY  (`link_keyword_keyword_id`),
  KEY `link_keyword_keyword_i01` (`parent_keyword_id`,`concept_relationship`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_keyword_umls_semantic_type` (
  `link_keyword_umls_semantic_type_id` int(10) unsigned NOT NULL auto_increment,
  `parent_keyword_id` int(10) NOT NULL default '0',
  `child_umls_semantic_type_id` int(10) NOT NULL default '0',
  PRIMARY KEY  (`link_keyword_umls_semantic_type_id`),
  KEY `link_keyword_umls_semantic_type_i01` (`parent_keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_keyword_umls_string` (
  `link_keyword_umls_string_id` int(10) unsigned NOT NULL auto_increment,
  `parent_keyword_id` int(10) NOT NULL default '0',
  `child_umls_string_id` int(10) NOT NULL default '0',
  `term_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  PRIMARY KEY  (`link_keyword_umls_string_id`),
  KEY `link_keyword_umls_string_i01` (`parent_keyword_id`),
  KEY `link_keyword_umls_string_i02` (`child_umls_string_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_phase_battery` (
  `link_phase_battery_id` int(10) unsigned NOT NULL auto_increment,
  `parent_phase_id` int(10) unsigned NOT NULL default '0',
  `child_battery_id` int(10) unsigned NOT NULL default '0',
  `sort_order` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`link_phase_battery_id`),
  UNIQUE KEY `link_phase_battery_u01` (`parent_phase_id`,`child_battery_id`),
  KEY `link_phase_battery_i01` (`parent_phase_id`),
  KEY `link_phase_battery_i02` (`child_battery_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_phase_battery_history` (
  `link_phase_battery_history_id` int(10) unsigned NOT NULL auto_increment,
  `link_phase_battery_id` int(10) unsigned NOT NULL default '0',
  `parent_phase_id` int(10) unsigned NOT NULL default '0',
  `child_battery_id` int(10) unsigned NOT NULL default '0',
  `sort_order` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`link_phase_battery_history_id`),
  KEY `link_phase_battery_history_i01` (`link_phase_battery_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_phase_content` (
  `link_phase_content_id` int(10) unsigned NOT NULL auto_increment,
  `parent_phase_id` int(10) unsigned NOT NULL default '0',
  `child_content_id` int(10) unsigned NOT NULL default '0',
  `link_type` enum('Reference','Narrative') NOT NULL default 'Reference',
  `display_type` enum('Link','Inline') NOT NULL default 'Link',
  `sort_order` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`link_phase_content_id`),
  UNIQUE KEY `link_phase_content_u01` (`parent_phase_id`,`child_content_id`,`link_type`),
  KEY `link_phase_content_i01` (`parent_phase_id`),
  KEY `link_phase_content_i02` (`child_content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_phase_content_history` (
  `link_phase_content_history_id` int(10) unsigned NOT NULL auto_increment,
  `link_phase_content_id` int(10) unsigned NOT NULL default '0',
  `parent_phase_id` int(10) unsigned NOT NULL default '0',
  `child_content_id` int(10) unsigned NOT NULL default '0',
  `link_type` enum('Reference','Narrative') NOT NULL default 'Reference',
  `display_type` enum('Link','Inline') NOT NULL default 'Link',
  `sort_order` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`link_phase_content_history_id`),
  KEY `link_phase_content_history_i01` (`link_phase_content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_phase_keyword` (
  `link_phase_keyword_id` int(10) unsigned NOT NULL auto_increment,
  `parent_phase_id` int(10) unsigned NOT NULL default '0',
  `child_keyword_id` int(10) unsigned NOT NULL default '0',
  `sort_order` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`link_phase_keyword_id`),
  UNIQUE KEY `link_phase_keyword_u01` (`parent_phase_id`,`child_keyword_id`),
  KEY `link_phase_keyword_i01` (`parent_phase_id`),
  KEY `link_phase_keyword_i02` (`child_keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_phase_keyword_history` (
  `link_phase_keyword_history_id` int(10) unsigned NOT NULL auto_increment,
  `link_phase_keyword_id` int(10) unsigned NOT NULL default '0',
  `parent_phase_id` int(10) unsigned NOT NULL default '0',
  `child_keyword_id` int(10) unsigned NOT NULL default '0',
  `sort_order` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`link_phase_keyword_history_id`),
  KEY `link_phase_keyword_history_i01` (`link_phase_keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_phase_quiz` (
  `link_phase_quiz_id` int(10) unsigned NOT NULL auto_increment,
  `parent_phase_id` int(10) unsigned NOT NULL default '0',
  `child_quiz_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `allow_resubmit` tinyint(1) NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`link_phase_quiz_id`),
  UNIQUE KEY `link_phase_quiz_u01` (`parent_phase_id`,`child_quiz_id`),
  KEY `link_phase_quiz_i01` (`parent_phase_id`),
  KEY `link_phase_quiz_i02` (`child_quiz_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_phase_quiz_history` (
  `link_phase_quiz_history_id` int(10) unsigned NOT NULL auto_increment,
  `link_phase_quiz_id` int(10) unsigned NOT NULL default '0',
  `parent_phase_id` int(10) unsigned NOT NULL default '0',
  `child_quiz_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `allow_resubmit` tinyint(1) NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`link_phase_quiz_history_id`),
  KEY `link_phase_quiz_history_i01` (`link_phase_quiz_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_phase_user` (
  `link_phase_user_id` int(10) unsigned NOT NULL auto_increment,
  `parent_phase_id` int(10) unsigned NOT NULL default '0',
  `child_user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `role` enum('Author','Editor') NOT NULL default 'Author',
  `sort_order` int(10) NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`link_phase_user_id`),
  UNIQUE KEY `link_phase_user_u03` (`parent_phase_id`,`child_user_id`),
  KEY `link_phase_user_i01` (`parent_phase_id`),
  KEY `link_phase_user_i02` (`child_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_phase_user_history` (
  `link_phase_user_history_id` int(10) unsigned NOT NULL auto_increment,
  `link_phase_user_id` int(10) unsigned NOT NULL default '0',
  `parent_phase_id` int(10) unsigned NOT NULL default '0',
  `child_user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `role` enum('Author','Editor') NOT NULL default 'Author',
  `sort_order` int(10) NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`link_phase_user_history_id`),
  KEY `link_phase_user_history_i01` (`link_phase_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_question_question` (
  `link_question_question_id` int(10) unsigned NOT NULL auto_increment,
  `parent_question_id` int(10) unsigned NOT NULL default '0',
  `child_question_id` int(10) unsigned NOT NULL default '0',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `sort_order` int(10) unsigned NOT NULL default '0',
  `points` float default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  PRIMARY KEY  (`link_question_question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_question_question_history` (
  `link_question_question_history_id` int(10) unsigned NOT NULL auto_increment,
  `link_question_question_id` int(10) unsigned NOT NULL default '0',
  `parent_question_id` int(10) unsigned NOT NULL default '0',
  `child_question_id` int(10) unsigned NOT NULL default '0',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `sort_order` int(10) unsigned NOT NULL default '0',
  `points` float default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `history_action` enum('Insert','Update','Delete') NOT NULL default 'Insert',
  PRIMARY KEY  (`link_question_question_history_id`),
  KEY `link_question_question_id` (`link_question_question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_quiz_quiz_item` (
  `link_quiz_quiz_item_id` int(10) unsigned NOT NULL auto_increment,
  `quiz_id` int(10) unsigned NOT NULL default '0',
  `quiz_item_id` int(10) unsigned NOT NULL default '0',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `sort_order` int(10) unsigned NOT NULL default '0',
  `points` float default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  PRIMARY KEY  (`link_quiz_quiz_item_id`),
  KEY `link_quiz_quiz_item_i01` (`quiz_item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_quiz_quiz_item_history` (
  `link_quiz_quiz_item_history_id` int(10) unsigned NOT NULL auto_increment,
  `link_quiz_quiz_item_id` int(10) unsigned NOT NULL default '0',
  `quiz_id` int(10) unsigned NOT NULL default '0',
  `quiz_item_id` int(10) unsigned NOT NULL default '0',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `sort_order` int(10) unsigned NOT NULL default '0',
  `points` float default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `history_action` enum('Insert','Update','Delete') NOT NULL default 'Insert',
  PRIMARY KEY  (`link_quiz_quiz_item_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_search_query_content` (
  `link_search_query_content_id` int(10) unsigned NOT NULL auto_increment,
  `parent_search_query_id` int(10) unsigned NOT NULL default '0',
  `child_content_id` int(10) unsigned NOT NULL default '0',
  `computed_score` float NOT NULL default '0',
  PRIMARY KEY  (`link_search_query_content_id`),
  KEY `link_search_query_content_i01` (`parent_search_query_id`),
  KEY `child_content_id` (`child_content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_search_query_content_history` (
  `link_search_query_content_history_id` int(10) unsigned NOT NULL auto_increment,
  `link_search_query_content_id` int(10) unsigned NOT NULL default '0',
  `parent_search_query_id` int(10) unsigned NOT NULL default '0',
  `child_content_id` int(10) unsigned NOT NULL default '0',
  `computed_score` float NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`link_search_query_content_history_id`),
  KEY `link_search_query_content_history_i01` (`link_search_query_content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_search_query_search_query` (
  `link_search_query_search_query_id` int(10) unsigned NOT NULL auto_increment,
  `parent_search_query_id` int(10) unsigned NOT NULL default '0',
  `child_search_query_id` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`link_search_query_search_query_id`),
  KEY `link_search_query_search_query_i01` (`parent_search_query_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_search_query_search_query_history` (
  `link_search_query_search_query_history_id` int(10) unsigned NOT NULL auto_increment,
  `link_search_query_search_query_id` int(10) unsigned NOT NULL default '0',
  `parent_search_query_id` int(10) unsigned NOT NULL default '0',
  `child_search_query_id` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`link_search_query_search_query_history_id`),
  KEY `link_search_query_search_query_history_i01` (`link_search_query_search_query_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_user_course_grade` (
  `link_user_course_grade_id` int(10) unsigned NOT NULL auto_increment,
  `course_id` int(10) unsigned default NULL,
  `time_period_id` int(10) unsigned default NULL,
  `user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `course_grade` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `average` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_on` datetime default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`link_user_course_grade_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_user_course_grade_history` (
  `link_user_course_grade_id_history` int(10) unsigned NOT NULL auto_increment,
  `link_user_course_grade_id` int(10) unsigned NOT NULL default '0',
  `course_id` int(10) unsigned default NULL,
  `time_period_id` int(10) unsigned default NULL,
  `user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `course_grade` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  `average` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_on` datetime default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`link_user_course_grade_id_history`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_user_grade_event` (
  `link_user_grade_event_id` int(10) unsigned NOT NULL auto_increment,
  `parent_user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `child_grade_event_id` int(10) unsigned NOT NULL default '0',
  `grade` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `comments` text CHARACTER SET utf8,
  `user_group_id` int(10) unsigned NOT NULL default '0',
  `teaching_site_id` int(10) default '0',
  `coding_code_id` tinyint(3) default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`link_user_grade_event_id`),
  UNIQUE KEY `link_user_grade_event_u01` (`parent_user_id`,`child_grade_event_id`),
  KEY `link_user_grade_event_i01` (`parent_user_id`),
  KEY `link_user_grade_event_i02` (`child_grade_event_id`),
  KEY `coding_code_id` (`coding_code_id`),
  KEY `teaching_site_id` (`teaching_site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_user_grade_event_history` (
  `link_user_grade_event_history_id` int(10) unsigned NOT NULL auto_increment,
  `link_user_grade_event_id` int(10) unsigned NOT NULL default '0',
  `parent_user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `child_grade_event_id` int(10) unsigned NOT NULL default '0',
  `grade` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `comments` text CHARACTER SET utf8,
  `user_group_id` int(10) unsigned NOT NULL default '0',
  `teaching_site_id` int(10) default '0',
  `coding_code_id` tinyint(3) default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') NOT NULL default 'Insert',
  PRIMARY KEY  (`link_user_grade_event_history_id`),
  KEY `link_user_grade_event_history_i01` (`parent_user_id`),
  KEY `link_user_grade_event_history_i02` (`child_grade_event_id`),
  KEY `coding_code_id` (`coding_code_id`),
  KEY `teaching_site_id` (`teaching_site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `link_user_group_case` (
  `link_user_group_case_id` int(10) unsigned NOT NULL auto_increment,
  `parent_user_group_id` int(10) unsigned NOT NULL default '0',
  `child_case_id` int(10) unsigned NOT NULL default '0',
  `school_id` int(10) unsigned NOT NULL default '0',
  `time_period_id` int(10) unsigned NOT NULL default '0',
  `available_date` datetime default NULL,
  `due_date` datetime default NULL,
  `sort_order` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified` datetime default NULL,
  PRIMARY KEY  (`link_user_group_case_id`),
  UNIQUE KEY `link_user_group_u04` (`parent_user_group_id`,`child_case_id`),
  KEY `link_user_group_i01` (`parent_user_group_id`),
  KEY `link_user_group_i02` (`child_case_id`),
  KEY `link_user_group_i03` (`school_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `log_item_type` (
  `log_item_type_id` int(10) unsigned NOT NULL auto_increment,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `token` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`log_item_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
INSERT INTO `log_item_type` VALUES (1,'Log-in','LOGIN','bkessler','2005-05-03 03:22:54','bkessler','2005-05-03 03:22:54'),(2,'Content','CONTENT','bkessler','2005-05-03 03:22:54','bkessler','2005-05-03 03:22:54'),(3,'Course','COURSE','bkessler','2005-05-03 03:22:54','bkessler','2005-05-03 03:22:54'),(4,'Schedule','SCHEDULE','bkessler','2005-05-03 03:22:54','bkessler','2005-05-03 03:22:54'),(5,'Query','QUERY','bkessler','2005-05-03 03:22:54','bkessler','2005-05-03 03:22:54'),(6,'User','USER','bkessler','2005-05-03 03:22:54','bkessler','2005-05-03 03:22:54'),(7,'Personal Content','PERSONALCONTENT','bkessler','2005-05-03 03:22:54','bkessler','2005-05-03 03:22:54'),(8,'Modify','MODIFY','bkessler','2005-05-03 03:22:54','bkessler','2005-05-03 03:22:54'),(9,'Logout-Reminder','REMINDER','bkessler','2005-05-03 03:22:54','bkessler','2005-05-03 03:22:54'),(10,'Unknown','UNKNOWN','bkessler','2005-05-03 03:22:54','bkessler','2005-05-03 03:22:54');

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mobile_device` (
  `mobile_device_id` int(10) unsigned NOT NULL auto_increment,
  `user_agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`mobile_device_id`),
  KEY `user_agent` (`user_agent`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `multi_content_manager` (
  `multi_content_manager_id` int(11) NOT NULL auto_increment,
  `status` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci default 'uploading',
  `error` text CHARACTER SET utf8,
  `uploaded_file_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `directory` text CHARACTER SET utf8,
  `zip_file` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `zip_entities` int(11) NOT NULL default '0',
  `zip_entities_extracted` int(11) default '0',
  `previews_to_generate` int(11) default '0',
  `previews_generated` int(11) default '0',
  `size` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci default '0 b',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`multi_content_manager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ocw_calendar_config` (
  `ocw_calendar_config_id` int(11) NOT NULL auto_increment,
  `ocw_course_config_id` int(11) NOT NULL default '0',
  `calendar_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `calendar_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`ocw_calendar_config_id`),
  KEY `ocw_calendar_config_i01` (`ocw_course_config_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ocw_calendar_content_config` (
  `ocw_calendar_content_config_id` int(11) NOT NULL auto_increment,
  `ocw_calendar_config_id` int(11) NOT NULL default '0',
  `content_id` int(11) NOT NULL default '0',
  `class_meeting_content_type_id` int(11) NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`ocw_calendar_content_config_id`),
  UNIQUE KEY `ocw_calendar_content_config_u01` (`ocw_calendar_config_id`,`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ocw_course_config` (
  `ocw_course_config_id` int(11) NOT NULL auto_increment,
  `status` enum('Unpublished','Draft','Published') default 'Draft',
  `metadata_course_id` int(11) NOT NULL default '0',
  `metadata_school_id` int(11) NOT NULL default '0',
  `content_course_id` int(11) NOT NULL default '0',
  `content_school_id` int(11) NOT NULL default '0',
  `ocw_school_id` int(11) NOT NULL default '0',
  `time_period_id` int(11) NOT NULL default '0',
  `level_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `time_period_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `show_faculty` tinyint(1) NOT NULL default '0',
  `graphic_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `graphic_caption` text CHARACTER SET utf8,
  `small_graphic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `short_description` text CHARACTER SET utf8,
  `highlights` text CHARACTER SET utf8,
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `pub_month` int(2) default NULL,
  `pub_year` int(4) default NULL,
  `keywords` text CHARACTER SET utf8,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`ocw_course_config_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ocw_school` (
  `ocw_school_id` int(11) NOT NULL auto_increment,
  `status` enum('Active','Inactive') default 'Active',
  `sort_order` int(11) default '0',
  `school_id` int(11) NOT NULL default '0',
  `ocw_school_page` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `school_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `school_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `school_desc` text CHARACTER SET utf8,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`ocw_school_id`),
  UNIQUE KEY `ocw_school_u01` (`school_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `patient_log_approval` (
  `patient_log_approval_id` int(10) unsigned NOT NULL auto_increment,
  `form_id` int(10) unsigned default NULL,
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `approval_time` datetime default NULL,
  `approved_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  PRIMARY KEY  (`patient_log_approval_id`),
  KEY `form_id` (`form_id`),
  KEY `user_id` (`user_id`),
  KEY `approved_by` (`approved_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `patient_type` (
  `patient_type_id` int(10) unsigned NOT NULL auto_increment,
  `school_id` int(11) NOT NULL default '0',
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `sort_order` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`patient_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `patient_type_history` (
  `patient_type_history_id` int(10) unsigned NOT NULL auto_increment,
  `patient_type_id` int(10) unsigned NOT NULL default '0',
  `school_id` int(11) NOT NULL default '0',
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `sort_order` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`patient_type_history_id`),
  KEY `patient_type_history_i01` (`patient_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `permission_feature_type` (
  `feature_type_id` int(10) unsigned NOT NULL auto_increment,
  `feature_type_token` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `feature_type_desc` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`feature_type_id`),
  KEY `feature_type_token` (`feature_type_token`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
INSERT INTO `permission_feature_type` VALUES (1,'quiz','Quiz maker tool','psilev01','2005-09-15 06:06:47','psilev01','2005-09-15 06:06:47'),(2,'school','Schoolwide Permissions','psilev01','2005-09-15 06:06:47','psilev01','2005-09-15 06:06:47'),(3,'case','Case shell tool','migrate','2005-11-07 06:06:57','migrate','2005-11-07 06:06:57'),(4,'assignment','Assignment tool','dwalke01','2007-11-29 06:21:11','dwalke01','2007-11-29 06:21:11'),(5,'assessment','Assessment tool','isathi01','2010-11-04 06:04:41','isathi01','2010-11-04 06:04:41');

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `permission_feature_type_history` (
  `feature_type_history_id` int(10) unsigned NOT NULL auto_increment,
  `feature_type_id` int(10) unsigned NOT NULL default '0',
  `feature_type_token` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `feature_type_desc` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`feature_type_history_id`),
  KEY `feature_type_id` (`feature_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `permission_function` (
  `function_id` int(10) unsigned NOT NULL auto_increment,
  `function_token` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `function_desc` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`function_id`),
  KEY `function_token` (`function_token`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
INSERT INTO `permission_function` VALUES (1,'delete_quiz','Delete a particular quiz','psilev01','2005-09-15 06:06:47','psilev01','2005-09-15 06:06:47'),(2,'edit_quiz','Edit a particular quiz','psilev01','2005-09-15 06:06:47','psilev01','2005-09-15 06:06:47'),(3,'preview_quiz','Preview a particular quiz','psilev01','2005-09-15 06:06:47','psilev01','2005-09-15 06:06:47'),(4,'view_grades','View grades for a particular quiz','psilev01','2005-09-15 06:06:47','psilev01','2005-09-15 06:06:47'),(5,'edit_grades','Edit grades for a particular quiz','psilev01','2005-09-15 06:06:47','psilev01','2005-09-15 06:06:47'),(6,'users_quiz','Change permissions for a particular quiz','psilev01','2005-09-15 06:06:47','psilev01','2005-09-15 06:06:47'),(7,'export_quiz','Export quiz results to grade book','psilev01','2005-09-15 06:06:47','psilev01','2005-09-15 06:06:47'),(8,'answer_key_quiz','View answer key','psilev01','2005-09-15 06:06:47','psilev01','2005-09-15 06:06:47'),(9,'reports_quiz','View reports page','psilev01','2005-09-15 06:06:47','psilev01','2005-09-15 06:06:47'),(10,'reports_case','View reports for a particular case','migrate','2005-11-07 06:06:57','migrate','2005-11-07 06:06:57'),(11,'preview_case','Preview a particular case','migrate','2005-11-07 06:06:57','migrate','2005-11-07 06:06:57'),(12,'modify_case','Edit a particular case','migrate','2005-11-07 06:06:57','migrate','2005-11-07 06:06:57'),(13,'users_case','Change permissions for a particular case','migrate','2005-11-07 06:06:57','migrate','2005-11-07 06:06:57'),(14,'delete_case','Delete a particular case','migrate','2005-11-07 06:06:57','migrate','2005-11-07 06:06:57'),(15,'edit_assignment','Edit a particular assignment','dwalke01','2007-11-29 06:21:11','dwalke01','2007-11-29 06:21:11'),(16,'email_assignment','Email a particular assignment','dwalke01','2007-11-29 06:21:11','dwalke01','2007-11-29 06:21:11'),(17,'grade_assignment','View/Edit grades for an assignment','dwalke01','2007-11-29 06:21:11','dwalke01','2007-11-29 06:21:11'),(18,'users_assignment','Change permissions for an assignment','dwalke01','2007-11-29 06:21:11','dwalke01','2007-11-29 06:21:11'),(19,'delete_assignment','Delete a particular assignment','dwalke01','2007-11-29 06:21:11','dwalke01','2007-11-29 06:21:11'),(20,'edit_assessment','Edit a particular assessment','isathi01','2010-11-04 06:04:41','isathi01','2010-11-04 06:04:41'),(21,'email_assessment','Email a particular assessment','isathi01','2010-11-04 06:04:41','isathi01','2010-11-04 06:04:41'),(22,'perform_assessment','Assess students','isathi01','2010-11-04 06:04:41','isathi01','2010-11-04 06:04:41'),(23,'results_assessment','View/Edit results for an assessment','isathi01','2010-11-04 06:04:41','isathi01','2010-11-04 06:04:41'),(24,'users_assessment','Change permissions for an assessment','isathi01','2010-11-04 06:04:41','isathi01','2010-11-04 06:04:41'),(25,'delete_assessment','Delete a particular assessment','isathi01','2010-11-04 06:04:41','isathi01','2010-11-04 06:04:41'),(26,'notified_assessment','Be notified of change in student\'s asses','isathi01','2010-11-04 06:04:41','isathi01','2010-11-04 06:04:41'),(27,'quiz_completion','View quiz completion lists, email noncom','scorbe01','2011-09-21 07:00:00','scorbe01','2011-09-21 07:00:00');

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `permission_function_history` (
  `function_history_id` int(10) unsigned NOT NULL auto_increment,
  `function_id` int(10) unsigned NOT NULL default '0',
  `function_token` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `function_desc` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`function_history_id`),
  KEY `function_id` (`function_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `permission_role` (
  `role_id` int(10) unsigned NOT NULL auto_increment,
  `role_token` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `role_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `feature_type_id` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`role_id`),
  KEY `role_token` (`role_token`),
  KEY `feature_type_id` (`feature_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
INSERT INTO `permission_role` VALUES (1,'manager','Ability to do anything with a particular quiz',1,'psilev01','2005-09-15 06:06:47','psilev01','2005-09-15 06:06:47'),(2,'editor','Ability to edit the quiz; cannot see grades, reports or change permissions',1,'psilev01','2005-09-15 06:06:47','psilev01','2005-09-15 06:06:47'),(3,'grader','Ability to preview quiz, see reports and change grades; cannot edit quiz or change permissions',1,'psilev01','2005-09-15 06:06:47','psilev01','2005-09-15 06:06:47'),(4,'reviewer','Ability to preview the quiz',1,'psilev01','2005-09-15 06:06:47','psilev01','2005-09-15 06:06:47'),(5,'admin','Ability to do anything in CMS for a particular school',2,'psilev01','2005-09-15 06:06:47','psilev01','2005-09-15 06:06:47'),(6,'reviewer','Ability to preview case',3,'migrate','2005-11-07 06:06:57','migrate','2005-11-07 06:06:57'),(7,'editor','Ability to edit a case; cannot see reports',3,'migrate','2005-11-07 06:06:57','migrate','2005-11-07 06:06:57'),(8,'grader','Ability to preview case and see reports',3,'migrate','2005-11-07 06:06:57','migrate','2005-11-07 06:06:57'),(9,'author','Ability to do anything with a particular case.',3,'migrate','2005-11-07 06:06:57','migrate','2005-11-07 06:06:57'),(10,'manager','Ability to do anything with a particular assignment',4,'dwalke01','2007-11-29 06:21:11','dwalke01','2007-11-29 06:21:11'),(11,'editor','Ability to edit the assignment and email; cannot see grades, change permissions, or delete assignment',4,'dwalke01','2007-11-29 06:21:11','dwalke01','2007-11-29 06:21:11'),(12,'grader','Ability to view/edit grades for the assignment and email; cannot edit the assignment, change permissions, or delete assignment',4,'dwalke01','2007-11-29 06:21:11','dwalke01','2007-11-29 06:21:11'),(13,'manager','Ability to do anything with a particular assessment',5,'isathi01','2010-11-04 06:04:41','isathi01','2010-11-04 06:04:41'),(14,'editor','Ability to edit the assessment and email; cannot see grades, view results, change permissions, or delete assessment',5,'isathi01','2010-11-04 06:04:41','isathi01','2010-11-04 06:04:41'),(15,'assessor','Ability to assess students; cannot edit the assessment, view results, change permissions, or delete assessment',5,'isathi01','2010-11-04 06:04:41','isathi01','2010-11-04 06:04:41'),(16,'NCSA','Notification of change in student\'s assessor',5,'isathi01','2010-11-04 06:04:41','isathi01','2010-11-04 06:04:41');

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `permission_role_function` (
  `role_function_id` int(10) unsigned NOT NULL auto_increment,
  `role_id` int(10) unsigned NOT NULL default '0',
  `function_id` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`role_function_id`),
  KEY `role_id` (`role_id`),
  KEY `function_id` (`function_id`),
  KEY `role_id_2` (`role_id`,`function_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
INSERT INTO `permission_role_function` VALUES (1,1,1,'psilev01','2005-09-15 06:06:47','psilev01','2005-09-15 06:06:47'),(2,1,2,'psilev01','2005-09-15 06:06:47','psilev01','2005-09-15 06:06:47'),(3,1,3,'psilev01','2005-09-15 06:06:47','psilev01','2005-09-15 06:06:47'),(4,1,4,'psilev01','2005-09-15 06:06:47','psilev01','2005-09-15 06:06:47'),(5,1,5,'psilev01','2005-09-15 06:06:47','psilev01','2005-09-15 06:06:47'),(6,1,6,'psilev01','2005-09-15 06:06:47','psilev01','2005-09-15 06:06:47'),(7,1,7,'psilev01','2005-09-15 06:06:47','psilev01','2005-09-15 06:06:47'),(8,1,8,'psilev01','2005-09-15 06:06:47','psilev01','2005-09-15 06:06:47'),(9,1,9,'psilev01','2005-09-15 06:06:47','psilev01','2005-09-15 06:06:47'),(10,2,2,'psilev01','2005-09-15 06:06:47','psilev01','2005-09-15 06:06:47'),(11,2,3,'psilev01','2005-09-15 06:06:47','psilev01','2005-09-15 06:06:47'),(12,3,3,'psilev01','2005-09-15 06:06:47','psilev01','2005-09-15 06:06:47'),(13,3,4,'psilev01','2005-09-15 06:06:47','psilev01','2005-09-15 06:06:47'),(14,3,5,'psilev01','2005-09-15 06:06:47','psilev01','2005-09-15 06:06:47'),(15,3,7,'psilev01','2005-09-15 06:06:47','psilev01','2005-09-15 06:06:47'),(16,3,8,'psilev01','2005-09-15 06:06:47','psilev01','2005-09-15 06:06:47'),(17,3,9,'psilev01','2005-09-15 06:06:47','psilev01','2005-09-15 06:06:47'),(18,4,3,'psilev01','2005-09-15 06:06:47','psilev01','2005-09-15 06:06:47'),(19,9,10,'migrate','2005-11-07 06:06:57','migrate','2005-11-07 06:06:57'),(20,8,10,'migrate','2005-11-07 06:06:57','migrate','2005-11-07 06:06:57'),(21,9,11,'migrate','2005-11-07 06:06:57','migrate','2005-11-07 06:06:57'),(22,7,11,'migrate','2005-11-07 06:06:57','migrate','2005-11-07 06:06:57'),(23,8,11,'migrate','2005-11-07 06:06:57','migrate','2005-11-07 06:06:57'),(24,6,11,'migrate','2005-11-07 06:06:57','migrate','2005-11-07 06:06:57'),(25,9,12,'migrate','2005-11-07 06:06:57','migrate','2005-11-07 06:06:57'),(26,7,12,'migrate','2005-11-07 06:06:57','migrate','2005-11-07 06:06:57'),(27,9,13,'migrate','2005-11-07 06:06:57','migrate','2005-11-07 06:06:57'),(28,9,14,'migrate','2005-11-07 06:06:57','migrate','2005-11-07 06:06:57'),(29,10,15,'dwalke01','2007-11-29 06:21:11','dwalke01','2007-11-29 06:21:11'),(30,10,16,'dwalke01','2007-11-29 06:21:11','dwalke01','2007-11-29 06:21:11'),(31,10,17,'dwalke01','2007-11-29 06:21:11','dwalke01','2007-11-29 06:21:11'),(32,10,18,'dwalke01','2007-11-29 06:21:11','dwalke01','2007-11-29 06:21:11'),(33,10,19,'dwalke01','2007-11-29 06:21:11','dwalke01','2007-11-29 06:21:11'),(34,11,15,'dwalke01','2007-11-29 06:21:11','dwalke01','2007-11-29 06:21:11'),(35,11,16,'dwalke01','2007-11-29 06:21:11','dwalke01','2007-11-29 06:21:11'),(36,12,17,'dwalke01','2007-11-29 06:21:11','dwalke01','2007-11-29 06:21:11'),(37,12,16,'dwalke01','2007-11-29 06:21:11','dwalke01','2007-11-29 06:21:11'),(38,13,20,'isathi01','2010-11-04 06:04:41','isathi01','2010-11-04 06:04:41'),(39,13,21,'isathi01','2010-11-04 06:04:41','isathi01','2010-11-04 06:04:41'),(40,13,22,'isathi01','2010-11-04 06:04:41','isathi01','2010-11-04 06:04:41'),(41,13,23,'isathi01','2010-11-04 06:04:41','isathi01','2010-11-04 06:04:41'),(42,13,24,'isathi01','2010-11-04 06:04:41','isathi01','2010-11-04 06:04:41'),(43,13,25,'isathi01','2010-11-04 06:04:41','isathi01','2010-11-04 06:04:41'),(44,14,20,'isathi01','2010-11-04 06:04:41','isathi01','2010-11-04 06:04:41'),(45,14,21,'isathi01','2010-11-04 06:04:41','isathi01','2010-11-04 06:04:41'),(46,15,22,'isathi01','2010-11-04 06:04:41','isathi01','2010-11-04 06:04:41'),(47,16,26,'isathi01','2010-11-04 06:04:41','isathi01','2010-11-04 06:04:41'),(48,1,27,'scorbe01','2011-09-21 07:00:00','scorbe01','2011-09-21 07:00:00');

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `permission_role_function_history` (
  `role_function_history_id` int(10) unsigned NOT NULL auto_increment,
  `role_function_id` int(10) unsigned NOT NULL default '0',
  `role_id` int(10) unsigned NOT NULL default '0',
  `function_id` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`role_function_history_id`),
  KEY `role_function_id` (`role_function_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `permission_role_history` (
  `role_history_id` int(10) unsigned NOT NULL auto_increment,
  `role_id` int(10) unsigned NOT NULL default '0',
  `role_token` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `role_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `feature_type_id` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`role_history_id`),
  KEY `role_id` (`role_id`),
  KEY `feature_type_id` (`feature_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `permission_user_role` (
  `user_role_id` int(10) unsigned NOT NULL auto_increment,
  `user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `role_id` int(10) unsigned NOT NULL default '0',
  `feature_id` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`user_role_id`),
  KEY `user_id` (`user_id`),
  KEY `feature_id` (`feature_id`),
  KEY `user_id_2` (`user_id`,`feature_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `permission_user_role_history` (
  `user_role_history_id` int(10) unsigned NOT NULL auto_increment,
  `user_role_id` int(10) unsigned NOT NULL default '0',
  `user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `role_id` int(10) unsigned NOT NULL default '0',
  `feature_id` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`user_role_history_id`),
  KEY `user_role_id` (`user_role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phase` (
  `phase_id` int(10) unsigned NOT NULL auto_increment,
  `phase_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `phase_desc` text CHARACTER SET utf8,
  `main_text` text CHARACTER SET utf8,
  `instructions` text CHARACTER SET utf8,
  `phase_type_id` int(10) unsigned NOT NULL default '0',
  `shared` tinyint(1) NOT NULL default '0',
  `phase_option_type` enum('Rank Choices','LikelyUnlikely','Free Text') default NULL,
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `copyright` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `encounter` int(2) NOT NULL default '1',
  `is_generic` tinyint(1) NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`phase_id`),
  KEY `phase_i01` (`phase_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phase_history` (
  `phase_history_id` int(10) unsigned NOT NULL auto_increment,
  `phase_id` int(10) unsigned NOT NULL default '0',
  `phase_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `phase_desc` text CHARACTER SET utf8,
  `main_text` text CHARACTER SET utf8,
  `instructions` text CHARACTER SET utf8,
  `phase_type_id` int(10) unsigned NOT NULL default '0',
  `shared` tinyint(1) NOT NULL default '0',
  `phase_option_type` enum('Rank Choices','LikelyUnlikely','Free Text') default NULL,
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `copyright` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `encounter` int(2) NOT NULL default '1',
  `is_generic` tinyint(1) NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`phase_history_id`),
  KEY `phase_history_i01` (`phase_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phase_option` (
  `phase_option_id` int(10) unsigned NOT NULL auto_increment,
  `phase_id` int(10) unsigned NOT NULL default '0',
  `option_text` text CHARACTER SET utf8,
  `correct` int(3) NOT NULL default '0',
  `feedback` text CHARACTER SET utf8,
  `soap_type` enum('Subjective','Objective','Assessment','Plan') default NULL,
  `sort_order` int(10) default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`phase_option_id`),
  KEY `phase_option_i01` (`phase_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phase_option_history` (
  `phase_option_history_id` int(10) unsigned NOT NULL auto_increment,
  `phase_option_id` int(10) unsigned NOT NULL default '0',
  `phase_id` int(10) unsigned NOT NULL default '0',
  `option_text` text CHARACTER SET utf8,
  `correct` int(3) NOT NULL default '0',
  `feedback` text CHARACTER SET utf8,
  `soap_type` enum('Subjective','Objective','Assessment','Plan') default NULL,
  `sort_order` int(10) default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`phase_option_history_id`),
  KEY `phase_option_history_i01` (`phase_option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phase_type` (
  `phase_type_id` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `hide_phase_type` tinyint(1) NOT NULL default '0',
  `phase_type_object_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `default_sort_order` int(10) NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`phase_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
INSERT INTO `phase_type` VALUES (1,'Chief Complaint',0,NULL,2,'bkessler','2005-04-12 06:02:22','bkessler','2005-04-12 06:02:22'),(2,'History',0,'History',3,'bkessler','2005-04-12 06:02:22','bkessler','2005-04-12 06:02:22'),(3,'Physical Exam',0,'PhysicalExam',4,'bkessler','2005-04-12 06:02:22','bkessler','2005-04-12 06:02:22'),(4,'Differential Diagnosis',0,'DifferentialDiagnosis',5,'bkessler','2005-04-12 06:02:22','bkessler','2005-04-12 06:02:22'),(5,'Diagnostic Studies',0,'DiagnosticStudies',6,'bkessler','2005-04-12 06:02:22','bkessler','2005-04-12 06:02:22'),(6,'Diagnosis',0,'Diagnosis',7,'bkessler','2005-04-12 06:02:22','bkessler','2005-04-12 06:02:22'),(7,'Treatment',0,'Treatment',8,'bkessler','2005-04-12 06:02:22','bkessler','2005-04-12 06:02:22'),(8,'SOAP',0,'SOAP',9,'bkessler','2005-04-12 06:02:22','bkessler','2005-04-12 06:02:22'),(9,'Problem List',0,'ProblemList',10,'bkessler','2005-04-12 06:02:22','bkessler','2005-04-12 06:02:22'),(10,'Instructions',0,NULL,1,'bkessler','2005-05-25 17:13:08','bkessler','2005-05-25 17:13:08'),(11,'Summary',0,NULL,12,'bkessler','2005-05-31 10:11:59','bkessler','2005-05-31 10:11:59'),(12,'Quiz',0,'Quiz',11,'dwalke01','2010-12-02 05:46:13','dwalke01','2010-12-02 05:46:13');

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phase_type_history` (
  `phase_type_history_id` int(10) unsigned NOT NULL auto_increment,
  `phase_type_id` int(10) unsigned NOT NULL default '0',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `hide_phase_type` tinyint(1) NOT NULL default '0',
  `phase_type_object_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `default_sort_order` int(10) NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`phase_type_history_id`),
  KEY `phase_type_history_i01` (`phase_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `process_tracker_type` (
  `process_tracker_type_id` int(10) unsigned NOT NULL auto_increment,
  `token` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`process_tracker_type_id`),
  KEY `process_tracker_type_i01` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
INSERT INTO `process_tracker_type` VALUES (1,'tuskdoc','TUSKdoc','dwalke01','2011-10-25 06:05:06','dwalke01','2011-10-25 06:05:06');

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `process_tracker_status_type` (
  `process_tracker_status_type_id` int(10) unsigned NOT NULL auto_increment,
  `token` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(750) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`process_tracker_status_type_id`),
  KEY `process_tracker_status_type_i01` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
INSERT INTO `process_tracker_status_type` VALUES (1,'tuskdoc_received','Received','','dwalke01','2011-10-25 06:05:06','dwalke01','2011-10-25 06:05:06'),(2,'tuskdoc_processing','Processing','','dwalke01','2011-10-25 06:05:06','dwalke01','2011-10-25 06:05:06'),(3,'tuskdoc_completed','Completed','','dwalke01','2011-10-25 06:05:07','dwalke01','2011-10-25 06:05:07'),(4,'tuskdoc_completed_warn','Completed (with warnings)','','dwalke01','2011-10-25 06:05:07','dwalke01','2011-10-25 06:05:07'),(5,'tuskdoc_error','Error','','dwalke01','2011-10-25 06:05:07','dwalke01','2011-10-25 06:05:07');

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `process_tracker` (
  `process_tracker_id` int(10) unsigned NOT NULL auto_increment,
  `school_id` int(10) unsigned default NULL,
  `object_id` int(10) unsigned NOT NULL,
  `process_tracker_type_id` int(10) unsigned NOT NULL,
  `process_tracker_status_type_id` int(10) unsigned NOT NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`process_tracker_id`),
  KEY `process_tracker_i01` (`object_id`),
  KEY `process_tracker_i02` (`process_tracker_type_id`),
  KEY `process_tracker_i03` (`process_tracker_status_type_id`),
  KEY `process_tracker_i04` (`school_id`),
  CONSTRAINT `process_tracker_ibfk_1` FOREIGN KEY (`process_tracker_type_id`) REFERENCES `process_tracker_type` (`process_tracker_type_id`),
  CONSTRAINT `process_tracker_ibfk_2` FOREIGN KEY (`process_tracker_status_type_id`) REFERENCES `process_tracker_status_type` (`process_tracker_status_type_id`),
  CONSTRAINT `process_tracker_ibfk_3` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `process_tracker_history` (
  `process_tracker_history_id` int(10) unsigned NOT NULL auto_increment,
  `process_tracker_id` int(10) unsigned NOT NULL,
  `school_id` int(10) unsigned default NULL,
  `object_id` int(10) unsigned NOT NULL,
  `process_tracker_type_id` int(10) unsigned NOT NULL,
  `process_tracker_status_type_id` int(10) unsigned NOT NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`process_tracker_history_id`),
  KEY `process_tracker_history_i01` (`process_tracker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `quiz` (
  `quiz_id` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `instructions` text CHARACTER SET utf8,
  `ending_message` text CHARACTER SET utf8,
  `quiz_type` enum('Quiz','SelfAssessment','FeedbackQuiz') default NULL,
  `questions_per_page` int(10) unsigned NOT NULL default '0',
  `duration` time default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `random_question_level` int(1) unsigned default '0',
  `show_all_feedback` int(1) unsigned default '0',
  `hide_correct_answer` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`quiz_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `quiz_answer` (
  `quiz_answer_id` int(10) unsigned NOT NULL auto_increment,
  `quiz_question_id` int(10) unsigned NOT NULL default '0',
  `child_question_id` int(10) unsigned default NULL,
  `sort_order` smallint(6) unsigned NOT NULL default '0',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `correct` tinyint(1) NOT NULL default '0',
  `feedback` text CHARACTER SET utf8,
  `hint` text CHARACTER SET utf8,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  PRIMARY KEY  (`quiz_answer_id`),
  KEY `quiz_answer_i01` (`quiz_question_id`),
  KEY `quiz_answer_child_i01` (`child_question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `quiz_answer_history` (
  `quiz_answer_history_id` int(10) unsigned NOT NULL auto_increment,
  `quiz_answer_id` int(10) unsigned NOT NULL default '0',
  `quiz_question_id` int(10) unsigned NOT NULL default '0',
  `child_question_id` int(10) unsigned default NULL,
  `sort_order` smallint(6) unsigned NOT NULL default '0',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `correct` tinyint(1) NOT NULL default '0',
  `feedback` text CHARACTER SET utf8,
  `hint` text CHARACTER SET utf8,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `history_action` enum('Insert','Update','Delete') NOT NULL default 'Insert',
  PRIMARY KEY  (`quiz_answer_history_id`),
  KEY `quiz_answer_child_i01` (`child_question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `quiz_history` (
  `quiz_history_id` int(10) unsigned NOT NULL auto_increment,
  `quiz_id` int(10) unsigned NOT NULL default '0',
  `title` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `instructions` text CHARACTER SET utf8,
  `ending_message` text CHARACTER SET utf8,
  `quiz_type` enum('Quiz','SelfAssessment','FeedbackQuiz') default NULL,
  `questions_per_page` int(10) unsigned NOT NULL default '0',
  `duration` time default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `history_action` enum('Insert','Update','Delete') default NULL,
  `random_question_level` int(1) unsigned default '0',
  `show_all_feedback` int(1) unsigned default '0',
  `hide_correct_answer` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`quiz_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `quiz_question` (
  `quiz_question_id` int(10) unsigned NOT NULL auto_increment,
  `type` enum('TrueFalse','MultipleChoice','FillIn','Essay','Matching','MatchingChild','MultipleFillIn','Section') NOT NULL default 'TrueFalse',
  `title` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `body` text CHARACTER SET utf8,
  `feedback` text CHARACTER SET utf8,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  PRIMARY KEY  (`quiz_question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `quiz_question_copy` (
  `quiz_question_copy_id` int(10) unsigned NOT NULL auto_increment,
  `parent_copy_question_id` int(10) unsigned NOT NULL default '0',
  `child_copy_question_id` int(10) unsigned NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`quiz_question_copy_id`),
  KEY `parent_copy_question_id` (`parent_copy_question_id`),
  KEY `child_copy_question_id` (`child_copy_question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `quiz_question_copy_history` (
  `quiz_question_copy_history_id` int(10) unsigned NOT NULL auto_increment,
  `quiz_question_copy_id` int(10) unsigned default NULL,
  `parent_copy_question_id` int(10) unsigned NOT NULL default '0',
  `child_copy_question_id` int(10) unsigned NOT NULL default '0',
  `history_action` enum('Insert','Update','Delete') default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`quiz_question_copy_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `quiz_question_history` (
  `quiz_question_history_id` int(10) unsigned NOT NULL auto_increment,
  `quiz_question_id` int(10) unsigned NOT NULL default '0',
  `type` enum('TrueFalse','MultipleChoice','FillIn','Essay','Matching','MatchingChild','MultipleFillIn','Section') NOT NULL default 'TrueFalse',
  `title` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `body` text CHARACTER SET utf8,
  `feedback` text CHARACTER SET utf8,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `history_action` enum('Insert','Update','Delete') NOT NULL default 'Insert',
  PRIMARY KEY  (`quiz_question_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `quiz_question_keyword` (
  `quiz_question_keyword_id` int(10) NOT NULL auto_increment,
  `parent_link_quiz_quiz_item_id` int(11) NOT NULL default '0',
  `child_keyword_id` int(11) NOT NULL default '0',
  `sort_order` int(11) default NULL,
  `author_weight` tinyint(4) default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_on` datetime default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`quiz_question_keyword_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `quiz_random_question` (
  `quiz_random_question_id` int(10) unsigned NOT NULL auto_increment,
  `quiz_id` int(10) unsigned default '0',
  `user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `quiz_question_id` int(10) unsigned default '0',
  `sort_order` int(10) unsigned default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`quiz_random_question_id`),
  KEY `quiz_id` (`quiz_id`),
  KEY `user_id` (`user_id`),
  KEY `quiz_question_id` (`quiz_question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `quiz_random_question_history` (
  `quiz_random_question_history_id` int(10) unsigned NOT NULL auto_increment,
  `quiz_random_question_id` int(10) unsigned default '0',
  `quiz_id` int(10) unsigned default '0',
  `user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `quiz_question_id` int(10) unsigned default '0',
  `sort_order` int(10) unsigned default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`quiz_random_question_history_id`),
  KEY `quiz_random_question_id` (`quiz_random_question_id`),
  KEY `quiz_id` (`quiz_id`),
  KEY `user_id` (`user_id`),
  KEY `quiz_question_id` (`quiz_question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `quiz_response` (
  `quiz_response_id` int(10) unsigned NOT NULL auto_increment,
  `quiz_result_id` int(10) unsigned NOT NULL default '0',
  `link_type` enum('link_quiz_quiz_item','link_question_question') default 'link_quiz_quiz_item',
  `link_id` int(10) unsigned NOT NULL default '0',
  `quiz_answer_id` int(10) unsigned NOT NULL default '0',
  `response_text` text CHARACTER SET utf8,
  `graded_flag` tinyint(1) default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `graded_points` float default '0',
  PRIMARY KEY  (`quiz_response_id`),
  KEY `quiz_response_i01` (`link_id`),
  KEY `quiz_response_i02` (`quiz_answer_id`),
  KEY `quiz_response_i03` (`quiz_result_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `quiz_response_history` (
  `quiz_response_history_id` int(10) unsigned NOT NULL auto_increment,
  `quiz_response_id` int(10) unsigned NOT NULL default '0',
  `quiz_result_id` int(10) unsigned NOT NULL default '0',
  `link_type` enum('link_quiz_quiz_item','link_question_question') default 'link_quiz_quiz_item',
  `link_id` int(10) unsigned NOT NULL default '0',
  `quiz_answer_id` int(10) unsigned NOT NULL default '0',
  `response_text` text CHARACTER SET utf8,
  `graded_flag` tinyint(1) default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `history_action` enum('Insert','Update','Delete') NOT NULL default 'Insert',
  `graded_points` float default '0',
  PRIMARY KEY  (`quiz_response_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `quiz_result` (
  `quiz_result_id` int(10) unsigned NOT NULL auto_increment,
  `user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `quiz_id` int(10) unsigned NOT NULL default '0',
  `current_question_index` int(10) unsigned NOT NULL default '0',
  `start_date` datetime default NULL,
  `end_date` datetime default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `preview_flag` tinyint(1) default '0',
  PRIMARY KEY  (`quiz_result_id`),
  KEY `quiz_result_i01` (`user_id`),
  KEY `quiz_result_i02` (`quiz_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `quiz_result_history` (
  `quiz_result_history_id` int(10) unsigned NOT NULL auto_increment,
  `quiz_result_id` int(10) unsigned NOT NULL default '0',
  `user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `quiz_id` int(10) unsigned NOT NULL default '0',
  `current_question_index` int(10) unsigned NOT NULL default '0',
  `start_date` datetime default NULL,
  `end_date` datetime default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `history_action` enum('Insert','Update','Delete') NOT NULL default 'Insert',
  `preview_flag` tinyint(1) default '0',
  PRIMARY KEY  (`quiz_result_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `registration_user` (
  `registration_user_id` int(10) unsigned NOT NULL auto_increment,
  `school_id` int(10) NOT NULL default '0',
  `school_user_id` int(10) unsigned NOT NULL default '0',
  `user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `firstname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `midname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `lastname` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`registration_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `school_link` (
  `school_link_id` int(10) unsigned NOT NULL auto_increment,
  `school_id` int(10) unsigned NOT NULL default '0',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `url` text CHARACTER SET utf8,
  `parent_school_link_id` int(10) unsigned default NULL,
  `show_date` date default NULL,
  `hide_date` date default NULL,
  `sort_order` int(10) NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`school_link_id`),
  KEY `useful_link_i01` (`school_id`),
  KEY `parent_school_link_id` (`parent_school_link_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `school_link_history` (
  `school_link_history_id` int(10) unsigned NOT NULL auto_increment,
  `school_link_id` int(10) unsigned NOT NULL default '0',
  `school_id` int(10) unsigned NOT NULL default '0',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `url` text CHARACTER SET utf8,
  `parent_school_link_id` int(10) unsigned default NULL,
  `show_date` date default NULL,
  `hide_date` date default NULL,
  `sort_order` int(10) NOT NULL default '0',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`school_link_history_id`),
  KEY `school_link_id` (`school_link_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `search_query` (
  `search_query_id` int(10) unsigned NOT NULL auto_increment,
  `search_query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`search_query_id`),
  KEY `search_query_i01` (`search_query_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `search_query_field` (
  `search_query_field_id` int(10) unsigned NOT NULL auto_increment,
  `search_query_id` int(10) unsigned NOT NULL default '0',
  `search_query_field_type_id` int(10) unsigned NOT NULL default '0',
  `search_query_field` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`search_query_field_id`),
  KEY `search_query_field_i01` (`search_query_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `search_query_field_history` (
  `search_query_field_history_id` int(10) unsigned NOT NULL auto_increment,
  `search_query_field_id` int(10) unsigned NOT NULL default '0',
  `search_query_id` int(10) unsigned NOT NULL default '0',
  `search_query_field_type_id` int(10) unsigned NOT NULL default '0',
  `search_query_field` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`search_query_field_history_id`),
  KEY `search_query_field_history_i01` (`search_query_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `search_query_field_type` (
  `search_query_field_type_id` int(10) unsigned NOT NULL auto_increment,
  `search_query_field_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `display_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`search_query_field_type_id`),
  UNIQUE KEY `search_query_field_type_i01` (`search_query_field_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
INSERT INTO `search_query_field_type` VALUES (1,'author','Author','system','2007-05-23 04:33:45','system','2007-05-23 04:33:45'),(2,'title','Title','system','2007-05-23 04:33:45','system','2007-05-23 04:33:45'),(3,'media_type','Media Type','system','2007-05-23 04:33:45','system','2007-05-23 04:33:45'),(4,'copyright','Copyright','system','2007-05-23 04:33:45','system','2007-05-23 04:33:45'),(5,'school','School','system','2007-05-23 04:33:45','system','2007-05-23 04:33:45'),(6,'course','Course','system','2007-05-23 04:33:45','system','2007-05-23 04:33:45'),(7,'content_id','Content ID','system','2007-05-23 04:33:45','system','2007-05-23 04:33:45'),(8,'concepts','Concepts','system','2007-05-23 04:33:45','system','2007-05-23 04:33:45'),(9,'include_deleted_content','Include Deleted Content','dkiger01','2010-12-13 16:59:14','dkiger01','2010-12-13 16:59:14'),(10,'start_active_date','Active From','mprent01','2012-10-12 10:08:00','mprent01','2012-10-12 10:08:00'),(11,'end_active_date','Active To','mprent01','2012-10-12 10:08:00','mprent01','2012-10-12 10:08:00');

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `search_query_field_type_history` (
  `search_query_field_type_history_id` int(10) unsigned NOT NULL auto_increment,
  `search_query_field_type_id` int(10) unsigned NOT NULL default '0',
  `search_query_field_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`search_query_field_type_history_id`),
  KEY `search_query_field_type_history_i01` (`search_query_field_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `search_query_history` (
  `search_query_history_id` int(10) unsigned NOT NULL auto_increment,
  `search_query_id` int(10) unsigned NOT NULL default '0',
  `search_query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`search_query_history_id`),
  KEY `search_query_history_i01` (`search_query_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `search_result` (
  `search_result_id` int(10) unsigned NOT NULL auto_increment,
  `search_result_type_id` int(10) unsigned NOT NULL default '0',
  `search_result_category_id` int(10) unsigned NOT NULL default '0',
  `result_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `result_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entity_id` int(10) unsigned default NULL,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`search_result_id`),
  KEY `search_result_i01` (`search_result_category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;

CREATE TABLE IF NOT EXISTS `search_result_category` (
  `search_result_category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `school_id` int(10) unsigned NOT NULL DEFAULT '0',
  `category_label` varchar(255) NOT NULL DEFAULT '',
  `created_by` varchar(24) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` varchar(24) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`search_result_category_id`),
  KEY `search_result_category_i01` (`school_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;


SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE IF NOT EXISTS`search_result_category_history` (
  `search_result_category_history_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `search_result_category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `school_id` int(10) unsigned NOT NULL DEFAULT '0',
  `category_label` varchar(255) NOT NULL DEFAULT '',
  `created_by` varchar(24) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` varchar(24) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `history_action` enum('Insert','Update','Delete') DEFAULT NULL,
  PRIMARY KEY (`search_result_category_history_id`),
  KEY `search_result_category_history_i01` (`search_result_category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE IF NOT EXISTS `search_result_type` (
  `search_result_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL DEFAULT '',
  `created_by` varchar(24) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` varchar(24) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`search_result_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE IF NOT EXISTS  `search_result_type_history` (
  `search_result_type_history_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `search_result_type_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type_name` varchar(255) NOT NULL DEFAULT '',
  `created_by` varchar(24) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` varchar(24) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `history_action` enum('Insert','Update','Delete') DEFAULT NULL,
  PRIMARY KEY (`search_result_type_history_id`),
  KEY `search_result_type_history_i01` (`search_result_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE IF NOT EXISTS `search_term` (
  `search_term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `search_result_id` int(10) unsigned NOT NULL DEFAULT '0',
  `search_term` varchar(255) NOT NULL DEFAULT '',
  `created_by` varchar(24) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` varchar(24) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`search_term_id`),
  KEY `search_term_i01` (`search_term_id`),
  KEY `search_term_i02` (`search_term`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE IF NOT EXISTS `search_term_history` (
  `search_term_history_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `search_term_id` int(10) unsigned NOT NULL DEFAULT '0',
  `search_result_id` int(10) unsigned NOT NULL DEFAULT '0',
  `search_term` varchar(255) NOT NULL DEFAULT '',
  `created_by` varchar(24) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` varchar(24) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `history_action` enum('Insert','Update','Delete') DEFAULT NULL,
  PRIMARY KEY (`search_term_history_id`),
  KEY `search_term_history_i01` (`search_term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE IF NOT EXISTS `search_result_history` (
  `search_result_history_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `search_result_id` int(10) unsigned NOT NULL DEFAULT '0',
  `search_result_type_id` int(10) unsigned NOT NULL DEFAULT '0',
  `search_result_category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `result_label` varchar(255) NOT NULL DEFAULT '',
  `result_url` text NOT NULL,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `created_by` varchar(24) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` varchar(24) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `history_action` enum('Insert','Update','Delete') DEFAULT NULL,
  PRIMARY KEY (`search_result_history_id`),
  KEY `search_result_history_i01` (`search_result_id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;


SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `sessions` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `a_session` text CHARACTER SET utf8,
  `modified_on` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `shibboleth_user_history` (
  `shibboleth_user_id_history` int(10) unsigned NOT NULL auto_increment,
  `shibboleth_user_id` int(10) unsigned NOT NULL default '0',
  `shibboleth_institution_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `http_variable` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `http_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `user_greeting` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `enabled` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `logout_page` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `needs_regen` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci default 'N',
  `IdPXML` text CHARACTER SET utf8,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`shibboleth_user_id_history`),
  KEY `shibboleth_user_id` (`shibboleth_user_id`),
  CONSTRAINT `shibboleth_user_history_ibfk_1` FOREIGN KEY (`shibboleth_user_id`) REFERENCES `shibboleth_user` (`shibboleth_user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `teaching_site_history` (
  `teaching_site_history_id` int(10) unsigned NOT NULL auto_increment,
  `teaching_site_id` int(10) unsigned NOT NULL default '0',
  `school_id` int(10) NOT NULL default '0',
  `sitename` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `site_city_state` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `body` text CHARACTER SET utf8,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime default NULL,
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default 'Insert',
  PRIMARY KEY  (`teaching_site_history_id`),
  KEY `teaching_site_id` (`teaching_site_id`),
  KEY `school_id` (`school_id`),
  KEY `site_name` (`sitename`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `umls_concept_mention` (
  `umls_concept_mention_id` int(10) unsigned NOT NULL auto_increment,
  `keyword_id` int(10) NOT NULL default '0',
  `content_id` int(10) unsigned NOT NULL default '0',
  `context_mentioned` enum('Text','Header','Title','Keyword') NOT NULL default 'Text',
  `node_id` int(10) unsigned default NULL,
  `map_weight` int(10) unsigned default NULL,
  `mapped_text` text CHARACTER SET utf8,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  PRIMARY KEY  (`umls_concept_mention_id`),
  KEY `umls_concept_mention_i01` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `umls_concept_mention_history` (
  `umls_concept_mention_history_id` int(10) unsigned NOT NULL auto_increment,
  `umls_concept_mention_id` int(10) unsigned NOT NULL default '0',
  `keyword_id` int(10) NOT NULL default '0',
  `content_id` int(10) unsigned NOT NULL default '0',
  `context_mentioned` enum('Text','Header','Title','Keyword') NOT NULL default 'Text',
  `node_id` int(10) unsigned default NULL,
  `map_weight` int(10) unsigned default NULL,
  `mapped_text` text CHARACTER SET utf8,
  `created_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `created_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified_on` datetime default NULL,
  `history_action` enum('Insert','Update','Delete') default NULL,
  PRIMARY KEY  (`umls_concept_mention_history_id`),
  KEY `umls_concept_mention_history_i01` (`umls_concept_mention_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `umls_definition` (
  `umls_definition_id` int(10) unsigned NOT NULL auto_increment,
  `umls_definition_type_id` int(11) NOT NULL default '0',
  `keyword_id` int(10) NOT NULL default '0',
  `definition` mediumtext CHARACTER SET utf8,
  PRIMARY KEY  (`umls_definition_id`),
  KEY `umls_definition_i01` (`keyword_id`),
  KEY `umls_definition_i02` (`umls_definition_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `umls_definition_type` (
  `umls_definition_type_id` int(10) unsigned NOT NULL auto_increment,
  `definition_type_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `definition_type_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  PRIMARY KEY  (`umls_definition_type_id`),
  KEY `umls_definition_type_i01` (`definition_type_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
INSERT INTO `umls_definition_type` VALUES (1,'AI/RHEUM, 1993','AIR'),(2,'Alcohol and Other Drug Thesaurus, 2000','AOD'),(3,'Alternative Billing Concepts, 2006','ALT'),(4,'Authorized Osteopathic Thesaurus, 2003','AOT'),(5,'Beth Israel Vocabulary, 1.0','BI'),(6,'COSTAR, 1989-1995','COSTAR'),(7,'COSTART, 1995','CST'),(8,'CRISP Thesaurus, 2006','CSP'),(9,'Canonical Clinical Problem Statement System, 1999','CCPSS'),(10,'Clinical Classifications Software, 2005','CCS'),(11,'Clinical Terms Version 3 (CTV3) (Read Codes), 1999','RCD'),(12,'Common Terminology Criteria for Adverse Events, 2003','CTCAE'),(13,'Current Dental Terminology 2005 (CDT-5), 5','CDT'),(14,'Current Procedural Terminology, 2006','CPT'),(15,'Czech translation of the Medical Subject Headings, 2004','MSHCZE'),(16,'DSM-III-R, 1987','DSM3R'),(17,'DSM-IV, 1994','DSM4'),(18,'DXplain, 1994','DXP'),(19,'Descritores em Ciencias da Saude (Portuguese translation of the Medical Subject Headings), 2006','MSHPOR'),(20,'Descritores en Ciencias de la Salud (Spanish translation of the Medical Subject Headings), 2006','MSHSPA'),(21,'Diseases Database, 2000','DDB'),(22,'Finnish translations of the Medical Subject Headings, 2006','MSHFIN'),(23,'Gene Ontology, 2006_01_20','GO'),(24,'German translation of ICD10, 1995','DMDICD10'),(25,'German translation of UMDNS, 1996','DMDUMD'),(26,'German translation of the Medical Subject Headings, 2006','MSHGER'),(27,'HCPCS Version of Current Dental Terminology 2005 (CDT-5), 5','HCDT'),(28,'HCPCS Version of Current Procedural Terminology (CPT), 2006','HCPT'),(29,'HL7 Vocabulary Version 2.5, 2003_08_30','HL7V2.5'),(30,'HL7 Vocabulary Version 2.5, 7-bit equivalents, 2003_08','MTHHL7V2.5'),(31,'HL7 Vocabulary Version 3.0, 2006_05','HL7V3.0'),(32,'HUGO Gene Nomenclature, 2005_04','HUGO'),(33,'Healthcare Common Procedure Coding System, 2006','HCPCS'),(34,'Home Health Care Classification, 2003','HHC'),(35,'ICD-9-CM, 2005','ICD9CM'),(36,'ICD-9-CM, 2006','ICD9CM'),(37,'ICD-9-CM, 2007','ICD9CM'),(38,'ICD10, 1998','ICD10'),(39,'ICD10, American English Equivalents, 1998','ICD10AE'),(40,'ICD10, Dutch Translation, 200403','ICD10DUT'),(41,'ICPC, Basque Translation, 1993','ICPCBAQ'),(42,'ICPC, Danish Translation, 1993','ICPCDAN'),(43,'ICPC, Dutch Translation, 1993','ICPCDUT'),(44,'ICPC, Finnish Translation, 1993','ICPCFIN'),(45,'ICPC, French Translation, 1993','ICPCFRE'),(46,'ICPC, German Translation, 1993','ICPCGER'),(47,'ICPC, Hebrew Translation, 1993','ICPCHEB'),(48,'ICPC, Hungarian Translation, 1993','ICPCHUN'),(49,'ICPC, Italian Translation, 1993','ICPCITA'),(50,'ICPC, Norwegian Translation, 1993','ICPCNOR'),(51,'ICPC, Portuguese Translation, 1993','ICPCPOR'),(52,'ICPC, Spanish Translation, 1993','ICPCSPA'),(53,'ICPC, Swedish Translation, 1993','ICPCSWE'),(54,'ICPC-2 PLUS','ICPC2P'),(55,'ICPC2 - ICD10 Thesaurus, 200412','ICPC2ICD10ENG'),(56,'ICPC2 - ICD10 Thesaurus, 7-bit Equivalents, 0412','MTHICPC2ICD107B'),(57,'ICPC2 - ICD10 Thesaurus, American English Equivalents, 0412','MTHICPC2ICD10AE'),(58,'ICPC2-ICD10 Thesaurus, Dutch Translation, 200412','ICPC2ICD10DUT'),(59,'ICPC2E-ICD10 relationships from Dr. Henk Lamberts, 1998','HLREL'),(60,'International Classification of Primary Care 2nd Edition, Electronic, 2E, 200203','ICPC2EENG'),(61,'International Classification of Primary Care 2nd Edition, Electronic, 2E, American English Equivalents, 200203','MTHICPC2EAE'),(62,'International Classification of Primary Care 2nd Edition, Electronic, 2E, Dutch Translation, 200203','ICPC2EDUT'),(63,'International Classification of Primary Care, 1993','ICPC'),(64,'International Statistical Classification of Diseases and Related Health Problems, 10th Revision, Australian Modification, January 2000 Release','ICD10AM'),(65,'International Statistical Classification of Diseases and Related Health Problems, Australian Modification, Americanized English Equivalents, 2000','ICD10AMAE'),(66,'Italian translation of Medical Subject Headings, 2006','MSHITA'),(67,'JAMAS Japanese Medical Thesaurus (JJMT), 2005','MSHJPN'),(68,'LOINC 2.17','LNC'),(69,'Library of Congress Subject Headings, 1990','LCH'),(70,'MEDLINE (1996-2000)','MBD'),(71,'MEDLINE (2001-2006)','MED'),(72,'Master Drug Data Base, 2006_08_09','MDDB'),(73,'McMaster University Epidemiology Terms, 1992','MCM'),(74,'Medical Dictionary for Regulatory Activities Terminology (MedDRA), 6.0','MDR'),(75,'Medical Dictionary for Regulatory Activities Terminology (MedDRA), 9.0','MDR'),(76,'Medical Dictionary for Regulatory Activities Terminology (MedDRA), Dutch Edition, 9.0','MDRDUT'),(77,'Medical Dictionary for Regulatory Activities Terminology (MedDRA), French Edition, 9.0','MDRFRE'),(78,'Medical Dictionary for Regulatory Activities Terminology (MedDRA), German Edition, 9.0','MDRGER'),(79,'Medical Dictionary for Regulatory Activities Terminology (MedDRA), Italian Edition, 9.0','MDRITA'),(80,'Medical Dictionary for Regulatory Activities Terminology (MedDRA), Portuguese Edition, 9.0','MDRPOR'),(81,'Medical Dictionary for Regulatory Activities Terminology (MedDRA), Spanish Edition, 9.0','MDRSPA'),(82,'Medical Entities Dictionary, 2003','CPM'),(83,'Medical Subject Headings, 2005_2005_01_17','MSH'),(84,'Medical Subject Headings, 2007_2006_08_08','MSH'),(85,'MedlinePlus Health Topics_2004_08_14, 20040814','MEDLINEPLUS'),(86,'Metathesaurus CPT Hierarchical Terms, 2006','MTHCH'),(87,'Metathesaurus FDA National Drug Code Directory, 2006_08_04','MTHFDA'),(88,'Metathesaurus Forms of Physician Data Query, 2005','MTHPDQ'),(89,'Metathesaurus HCPCS Hierarchical Terms, 2006','MTHHH'),(90,'Metathesaurus Source Terminology Names','SRC'),(91,'Metathesaurus Version of Minimal Standard Terminology Digestive Endoscopy, 2001','MTHMST'),(92,'Metathesaurus Version of Minimal Standard Terminology Digestive Endoscopy, French Translation, 2001','MTHMSTFRE'),(93,'Metathesaurus Version of Minimal Standard Terminology Digestive Endoscopy, Italian Translation, 2001','MTHMSTITA'),(94,'Metathesaurus additional entry terms for ICD-9-CM, 2007','MTHICD9'),(95,'Micromedex DRUGDEX, 2006_07_31','MMX'),(96,'Multum MediSource Lexicon, 2006_08_01','MMSL'),(97,'NANDA nursing diagnoses: definitions & classification, 2004','NAN'),(98,'NCBI Taxonomy, 2006_01_04','NCBI'),(99,'NCI SEER ICD Neoplasm Code Mappings, 1999','NCISEER'),(100,'NCI modified Common Terminology Criteria for Adverse Events v3.0, 2003','NCI-CTCAE'),(101,'National Cancer Institute Thesaurus, 2006_03D','NCI'),(102,'National Drug Data File Plus Source Vocabulary, 2006_08_04','NDDF'),(103,'National Drug File - Reference Terminology, 2004_01','NDFRT'),(104,'National Library of Medicine Medline Data','NLM-MED'),(105,'Nederlandse vertaling van Mesh (Dutch translation of MeSH), 2005','MSHDUT'),(106,'Neuronames Brain Hierarchy, 1999','NEU'),(107,'Nursing Interventions Classification, 1999','NIC'),(108,'Nursing Outcomes Classification, 1997','NOC'),(109,'Omaha System, 1994','OMS'),(110,'Online Congenital Multiple Anomaly/Mental Retardation Syndromes, 1999','JABL'),(111,'Online Mendelian Inheritance in Man, 1993','MIM'),(112,'Patient Care Data Set, 1997','PCDS'),(113,'Perioperative Nursing Data Set, 2nd edition, 2002','PNDS'),(114,'Pharmacy Practice Activity Classification, 1998','PPAC'),(115,'Physician Data Query, 2005','PDQ'),(116,'Physicians\' Current Procedural Terminology, Spanish Translation, 2001','CPTSP'),(117,'QMR clinically related terms from Randolph A. Miller, 1999','RAM'),(118,'Quick Medical Reference (QMR), 1996','QMR'),(119,'Read thesaurus Americanized Synthesized Terms, 1999','RCDSA'),(120,'Read thesaurus, American English Equivalents, 1999','RCDAE'),(121,'Read thesaurus, Synthesized Terms, 1999','RCDSY'),(122,'Russian Translation of MeSH, 2006','MSHRUS'),(123,'RxNorm Vocabulary, 06AC_060901F','RXNORM'),(124,'SNOMED Clinical Terms, 2006_07_31','SNOMEDCT'),(125,'SNOMED Clinical Terms, Spanish Language Edition, 2006_04_30','SCTSPA'),(126,'SNOMED International, 1998','SNMI'),(127,'SNOMED-2, 2','SNM'),(128,'Standard Product Nomenclature, 2003','SPN'),(129,'Swedish translations of the Medical Subject Headings, 2005','MSHSWE'),(130,'The Universal Medical Device Nomenclature System (UMDNS), 2006','UMD'),(131,'Thesaurus Biomedical Francais/Anglais [French translation of MeSH], 2006','MSHFRE'),(132,'Thesaurus of Psychological Index Terms, 2004','PSY'),(133,'UMLS Metathesaurus','MTH'),(134,'USP Model Guidelines, 2004','USPMG'),(135,'UltraSTAR, 1993','ULT'),(136,'University of Washington Digital Anatomist, 1.7.3','UWDA'),(137,'Veterans Health Administration National Drug File, 2005_03_23, 2005_03_23','VANDF'),(138,'WHO Adverse Reaction Terminology, 1997','WHO'),(139,'WHOART, French Translation, 1997','WHOFRE'),(140,'WHOART, German Translation, 1997','WHOGER'),(141,'WHOART, Portuguese Translation, 1997','WHOPOR'),(142,'WHOART, Spanish Translation, 1997','WHOSPA');

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `umls_semantic_type` (
  `umls_semantic_type_id` int(11) NOT NULL auto_increment,
  `semantic_type_id` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `semantic_type` text CHARACTER SET utf8,
  PRIMARY KEY  (`umls_semantic_type_id`),
  UNIQUE KEY `umls_semantic_type_u01` (`semantic_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
INSERT INTO `umls_semantic_type` VALUES (1,'T001','Organism'),(2,'T002','Plant'),(3,'T003','Alga'),(4,'T004','Fungus'),(5,'T005','Virus'),(6,'T006','Rickettsia or Chlamydia'),(7,'T007','Bacterium'),(8,'T008','Animal'),(9,'T009','Invertebrate'),(10,'T010','Vertebrate'),(11,'T011','Amphibian'),(12,'T012','Bird'),(13,'T013','Fish'),(14,'T014','Reptile'),(15,'T015','Mammal'),(16,'T016','Human'),(17,'T017','Anatomical Structure'),(18,'T018','Embryonic Structure'),(19,'T019','Congenital Abnormality'),(20,'T020','Acquired Abnormality'),(21,'T021','Fully Formed Anatomical Structure'),(22,'T022','Body System'),(23,'T023','Body Part, Organ, or Organ Component'),(24,'T024','Tissue'),(25,'T025','Cell'),(26,'T026','Cell Component'),(27,'T028','Gene or Genome'),(28,'T029','Body Location or Region'),(29,'T030','Body Space or Junction'),(30,'T031','Body Substance'),(31,'T032','Organism Attribute'),(32,'T033','Finding'),(33,'T034','Laboratory or Test Result'),(34,'T037','Injury or Poisoning'),(35,'T038','Biologic Function'),(36,'T039','Physiologic Function'),(37,'T040','Organism Function'),(38,'T041','Mental Process'),(39,'T042','Organ or Tissue Function'),(40,'T043','Cell Function'),(41,'T044','Molecular Function'),(42,'T045','Genetic Function'),(43,'T046','Pathologic Function'),(44,'T047','Disease or Syndrome'),(45,'T048','Mental or Behavioral Dysfunction'),(46,'T049','Cell or Molecular Dysfunction'),(47,'T050','Experimental Model of Disease'),(48,'T051','Event'),(49,'T052','Activity'),(50,'T053','Behavior'),(51,'T054','Social Behavior'),(52,'T055','Individual Behavior'),(53,'T056','Daily or Recreational Activity'),(54,'T057','Occupational Activity'),(55,'T058','Health Care Activity'),(56,'T059','Laboratory Procedure'),(57,'T060','Diagnostic Procedure'),(58,'T061','Therapeutic or Preventive Procedure'),(59,'T062','Research Activity'),(60,'T063','Molecular Biology Research Technique'),(61,'T064','Governmental or Regulatory Activity'),(62,'T065','Educational Activity'),(63,'T066','Machine Activity'),(64,'T067','Phenomenon or Process'),(65,'T068','Human-caused Phenomenon or Process'),(66,'T069','Environmental Effect of Humans'),(67,'T070','Natural Phenomenon or Process'),(68,'T071','Entity'),(69,'T072','Physical Object'),(70,'T073','Manufactured Object'),(71,'T074','Medical Device'),(72,'T075','Research Device'),(73,'T077','Conceptual Entity'),(74,'T078','Idea or Concept'),(75,'T079','Temporal Concept'),(76,'T080','Qualitative Concept'),(77,'T081','Quantitative Concept'),(78,'T082','Spatial Concept'),(79,'T083','Geographic Area'),(80,'T085','Molecular Sequence'),(81,'T086','Nucleotide Sequence'),(82,'T087','Amino Acid Sequence'),(83,'T088','Carbohydrate Sequence'),(84,'T089','Regulation or Law'),(85,'T090','Occupation or Discipline'),(86,'T091','Biomedical Occupation or Discipline'),(87,'T092','Organization'),(88,'T093','Health Care Related Organization'),(89,'T094','Professional Society'),(90,'T095','Self-help or Relief Organization'),(91,'T096','Group'),(92,'T097','Professional or Occupational Group'),(93,'T098','Population Group'),(94,'T099','Family Group'),(95,'T100','Age Group'),(96,'T101','Patient or Disabled Group'),(97,'T102','Group Attribute'),(98,'T103','Chemical'),(99,'T104','Chemical Viewed Structurally'),(100,'T109','Organic Chemical'),(101,'T110','Steroid'),(102,'T111','Eicosanoid'),(103,'T114','Nucleic Acid, Nucleoside, or Nucleotide'),(104,'T115','Organophosphorus Compound'),(105,'T116','Amino Acid, Peptide, or Protein'),(106,'T118','Carbohydrate'),(107,'T119','Lipid'),(108,'T120','Chemical Viewed Functionally'),(109,'T121','Pharmacologic Substance'),(110,'T122','Biomedical or Dental Material'),(111,'T123','Biologically Active Substance'),(112,'T124','Neuroreactive Substance or Biogenic Amine'),(113,'T125','Hormone'),(114,'T126','Enzyme'),(115,'T127','Vitamin'),(116,'T129','Immunologic Factor'),(117,'T130','Indicator, Reagent, or Diagnostic Aid'),(118,'T131','Hazardous or Poisonous Substance'),(119,'T167','Substance'),(120,'T168','Food'),(121,'T169','Functional Concept'),(122,'T170','Intellectual Product'),(123,'T171','Language'),(124,'T184','Sign or Symptom'),(125,'T185','Classification'),(126,'T190','Anatomical Abnormality'),(127,'T191','Neoplastic Process'),(128,'T192','Receptor'),(129,'T194','Archaeon'),(130,'T195','Antibiotic'),(131,'T196','Element, Ion, or Isotope'),(132,'T197','Inorganic Chemical'),(133,'T200','Clinical Drug'),(134,'T201','Clinical Attribute'),(135,'T203','Drug Delivery Device');

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `umls_string` (
  `umls_string_id` int(11) NOT NULL auto_increment,
  `string_id` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `string_text` text CHARACTER SET utf8,
  PRIMARY KEY  (`umls_string_id`),
  UNIQUE KEY `umls_string_u01` (`string_id`),
  KEY `umls_string_i01` (`string_text`(20)),
  FULLTEXT KEY `string_text` (`string_text`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

