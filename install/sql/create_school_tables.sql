create database ##DB_NAME##
;

use ##DB_NAME##
;

-- Host: localhost   
-- ------------------------------------------------------
-- Table structure for table `announcement`

CREATE TABLE `announcement` (
  `announcement_id` int(10) unsigned NOT NULL auto_increment,
  `created` timestamp NOT NULL,`start_date` date NOT NULL default '0000-00-00',
  `expire_date` date NOT NULL default '0000-00-00',
  `username` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `user_group_id` int(10) unsigned NOT NULL default '0',
  `body` text CHARACTER SET utf8,
  PRIMARY KEY  (`announcement_id`),
  KEY `user_group_id` (`user_group_id`),
  KEY `expire_date` (`expire_date`),
  KEY `start_date` (`start_date`))
;

--
-- Table structure for table `class_meeting`
--

CREATE TABLE `class_meeting` (
  `class_meeting_id` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `oea_code` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `course_id` int(10) unsigned NOT NULL default '0',
  `type_id` int(10) unsigned default NULL,
  `meeting_date` date NOT NULL default '0000-00-00',
  `starttime` time NOT NULL default '00:00:00',
  `endtime` time default NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `is_duplicate` tinyint(1) unsigned default '0',
  `is_mandatory` tinyint(1) unsigned default '0',
  `modified` timestamp NOT NULL,
  `flagtime` datetime default NULL,
  `body` text CHARACTER SET utf8,
  PRIMARY KEY  (`class_meeting_id`),
  KEY `course_id` (`course_id`),
  KEY `unit_date` (`meeting_date`,`starttime`),
  KEY `oea_code` (`oea_code`),
  KEY `type_id` (`type_id`),
  KEY `is_duplicate` (`is_duplicate`))
;

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `oea_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `color` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `abbreviation` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `associate_users` set('User Group','Enrollment') default NULL,
  `type` enum('course','integrated course','committee','community service','group','thesis committee') default NULL,
  `course_source` enum('Catalog','Independent') default NULL,
  `modified` timestamp NOT NULL,
  `body` text CHARACTER SET utf8,
  `rss` tinyint(1) default '1',
  PRIMARY KEY  (`course_id`),
  KEY `title` (`title`))
;

--
-- Table structure for table `default_stylesheet`
--

CREATE TABLE `default_stylesheet` (
  `stylesheet_type_id` int(10) unsigned NOT NULL auto_increment,
  `default_stylesheet_id` int(10) unsigned default NULL,
  `modified` timestamp NOT NULL,
  PRIMARY KEY  (`stylesheet_type_id`))
;

--
-- Table structure for table `eval`
--

CREATE TABLE `eval` (
  `eval_id` int(10) unsigned NOT NULL auto_increment,
  `course_id` int(10) unsigned NOT NULL default '0',
  `time_period_id` int(10) unsigned NOT NULL default '0',
  `teaching_site_id` int(10) unsigned default NULL,
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `available_date` date NOT NULL default '0000-00-00',
  `modified` timestamp NOT NULL,
  `due_date` date NOT NULL default '0000-00-00',
  `prelim_due_date` date default NULL,
  `submittable_date` date default NULL,
  `question_stylesheet` int(10) default NULL,
  `results_stylesheet` int(10) default NULL,
  PRIMARY KEY  (`eval_id`),
  KEY `course_id` (`course_id`),
  KEY `available_date` (`available_date`))
;

--
-- Table structure for table `eval_completion`
--

CREATE TABLE `eval_completion` (
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `eval_id` int(10) unsigned NOT NULL default '0',
  `created` timestamp NOT NULL,
  `status` enum('Done','Not done') NOT NULL default 'Not done',
  PRIMARY KEY  (`user_id`,`eval_id`),
  KEY `eval_id` (`eval_id`,`status`))
;

--
-- Table structure for table `eval_mergedresults_graphics`
--

CREATE TABLE `eval_mergedresults_graphics` (
  `eval_mergedresults_graphics_id` int(10) unsigned NOT NULL auto_increment,
  `merged_eval_results_id` int(10) unsigned NOT NULL default '0',
  `eval_question_id` int(10) unsigned NOT NULL default '0',
  `mime_type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default 'image/png',
  `width` int(10) unsigned NOT NULL default '0',
  `height` int(10) unsigned NOT NULL default '0',
  `graphic` mediumblob NOT NULL,
  `graphic_text` text CHARACTER SET utf8,
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`eval_mergedresults_graphics_id`),
  KEY `eval_id` (`merged_eval_results_id`,`eval_question_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13617 DEFAULT CHARSET=latin1
;

--
-- Table structure for table `eval_question`
--

CREATE TABLE `eval_question` (
  `eval_question_id` int(10) unsigned NOT NULL auto_increment,
  `body` text CHARACTER SET utf8,
  `modified` timestamp NOT NULL,
  PRIMARY KEY  (`eval_question_id`))
;

--
-- Table structure for table `eval_question_convert`
--

CREATE TABLE `eval_question_convert` (
  `eval_question_id` int(10) unsigned NOT NULL default '0',
  `new_body` text CHARACTER SET utf8,
  PRIMARY KEY  (`eval_question_id`))
;

--
-- Table structure for table `eval_response`
--

CREATE TABLE `eval_response` (
  `user_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '0',
  `eval_id` int(10) unsigned NOT NULL default '0',
  `eval_question_id` int(10) unsigned NOT NULL default '0',
  `response` text CHARACTER SET utf8,
  `fixed` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`eval_id`,`eval_question_id`,`user_code`),
  KEY `user_code` (`user_code`,`eval_id`))
;

--
-- Table structure for table `eval_results_graphics`
--

CREATE TABLE `eval_results_graphics` (
  `eval_results_graphics_id` int(10) unsigned NOT NULL auto_increment,
  `eval_id` int(10) unsigned NOT NULL default '0',
  `eval_question_id` int(10) unsigned NOT NULL default '0',
  `categorization_question_id` int(10) unsigned default NULL,
  `categorization_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `mime_type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default 'image/png',
  `width` int(10) unsigned NOT NULL default '0',
  `height` int(10) unsigned NOT NULL default '0',
  `graphic` mediumblob NOT NULL,
  `modified` timestamp NOT NULL,
  PRIMARY KEY  (`eval_results_graphics_id`),
  KEY `eval_id` (`eval_id`,`eval_question_id`))
;

--
-- Table structure for table `eval_results_histogram`
--

CREATE TABLE `eval_results_histogram` (
  `eval_results_histogram_id` int(10) unsigned NOT NULL auto_increment,
  `eval_id` int(10) unsigned NOT NULL default '0',
  `eval_question_id` int(10) default NULL,
  `categorization_question_id` int(10) unsigned default NULL,
  `categorization_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `mime_type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default 'text/html',
  `width` int(10) unsigned NOT NULL default '0',
  `height` int(10) unsigned NOT NULL default '0',
  `graphic` mediumblob NOT NULL,
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`eval_results_histogram_id`),
  KEY `eval_id` (`eval_id`,`eval_question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1
;


--
-- Table structure for table `eval_merged_results_histogram`
--


CREATE TABLE `eval_merged_results_histogram` (
  `eval_merged_results_histogram_id` int(10) unsigned NOT NULL auto_increment,
  `merged_eval_results_id` int(10) unsigned NOT NULL default '0',
  `eval_question_id` int(10) default NULL,
  `categorization_question_id` int(10) unsigned default NULL,
  `categorization_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `mime_type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default 'text/html',
  `width` int(10) unsigned NOT NULL default '0',
  `height` int(10) unsigned NOT NULL default '0',
  `graphic` mediumblob NOT NULL,
  `graphic_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`eval_merged_results_histogram_id`),
  KEY `merged_eval_results_id` (`merged_eval_results_id`,`eval_question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1
;

--
-- Table structure for table `eval_results_supporting_graphs`
--

CREATE TABLE `eval_results_supporting_graphs` (
  `eval_results_support_graph_id` int(10) unsigned NOT NULL auto_increment,
  `eval_id` int(10) unsigned NOT NULL default '0',
  `eval_question_id` int(10) default NULL,
  `graph_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `categorization_question_id` int(10) unsigned default NULL,
  `categorization_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `mime_type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default 'text/html',
  `width` int(10) unsigned NOT NULL default '0',
  `height` int(10) unsigned NOT NULL default '0',
  `graphic` mediumblob NOT NULL,
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`eval_results_support_graph_id`),
  KEY `eval_id` (`eval_id`,`eval_question_id`,`graph_type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1
;

--
-- Table structure for table `eval_merged_results_supporting_graphs`

CREATE TABLE `eval_merged_results_supporting_graphs` (
  `eval_merged_results_support_graph_id` int(10) unsigned NOT NULL auto_increment,
  `merged_eval_results_id` int(10) unsigned NOT NULL default '0',
  `eval_question_id` int(10) default NULL,
  `graph_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `categorization_question_id` int(10) unsigned default NULL,
  `categorization_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `mime_type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default 'text/html',
  `width` int(10) unsigned NOT NULL default '0',
  `height` int(10) unsigned NOT NULL default '0',
  `graphic` mediumblob NOT NULL,
  `graphic_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`eval_merged_results_support_graph_id`),
  KEY `merged_eval_results_id` (`merged_eval_results_id`,`eval_question_id`,`graph_type`)
) ENGINE=MyISAM AUTO_INCREMENT=1721 DEFAULT CHARSET=latin1
;

--
-- Table structure for table `eval_save_data`
--

CREATE TABLE `eval_save_data` (
  `eval_save_data_id` int(10) unsigned NOT NULL auto_increment,
  `user_eval_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `data` text CHARACTER SET utf8,
  PRIMARY KEY  (`eval_save_data_id`),
  KEY `user_eval_code` (`user_eval_code`))
;

--
-- Table structure for table `homepage_category`
--

CREATE TABLE `homepage_category` (
  `id` int(10) NOT NULL auto_increment,
  `primary_user_group_id` int(10) default NULL,
  `secondary_user_group_id` int(10) default NULL,
  `label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `sort_order` int(10) default NULL,
  `schedule` int(1) default NULL,
  `modified` timestamp NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `user_group` (`primary_user_group_id`))
;

--
-- Table structure for table `homepage_course`
--

CREATE TABLE `homepage_course` (
  `id` int(10) NOT NULL auto_increment,
  `course_id` int(10) default NULL,
  `category_id` int(10) default NULL,
  `sort_order` int(10) default NULL,
  `label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `indent` int(1) default NULL,
  `modified` timestamp NOT NULL,
  `last_changed` datetime default NULL,
  `show_date` date default NULL,
  `hide_date` date default NULL,
  PRIMARY KEY  (`id`),
  KEY `course` (`course_id`),
  KEY `category` (`category_id`))
;

--
-- Table structure for table `hot_content_cache`
--

CREATE TABLE `hot_content_cache` (
  `user_group_id` int(10) unsigned NOT NULL default '0',
  `modified` timestamp NOT NULL,
  `content_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  PRIMARY KEY  (`user_group_id`),
  KEY `modified` (`modified`))
;

--
-- Table structure for table `link_class_meeting_content`
--

CREATE TABLE `link_class_meeting_content` (
  `link_class_meeting_content_id` int(11) NOT NULL auto_increment,
  `parent_class_meeting_id` int(10) unsigned NOT NULL default '0',
  `child_content_id` int(10) unsigned NOT NULL default '0',
  `class_meeting_content_type_id` int(11) NOT NULL default '0',
  `anchor_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `sort_order` smallint(6) unsigned NOT NULL default '65535',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified` timestamp NOT NULL,
  PRIMARY KEY  (`link_class_meeting_content_id`),
  UNIQUE KEY `link_class_meeting_content_u01` (`parent_class_meeting_id`,`child_content_id`,`class_meeting_content_type_id`),
  KEY `child_content_id` (`child_content_id`),
  KEY `parent_class_meeting_id` (`parent_class_meeting_id`,`sort_order`))
;

--
-- Table structure for table `link_class_meeting_topic`
--

CREATE TABLE `link_class_meeting_topic` (
  `parent_class_meeting_id` int(10) unsigned NOT NULL default '0',
  `child_topic_id` int(10) unsigned NOT NULL default '0',
  `sort_order` smallint(6) unsigned NOT NULL default '65535',
  `relationship` enum('Prerequisite','Topic','Evaluation','Subtopic') default NULL,
  `modified` timestamp NOT NULL,
  PRIMARY KEY  (`parent_class_meeting_id`,`child_topic_id`),
  KEY `child_topic_id` (`child_topic_id`),
  KEY `parent_class_meeting_id` (`parent_class_meeting_id`,`sort_order`))
;

--
-- Table structure for table `link_class_meeting_user`
--

CREATE TABLE `link_class_meeting_user` (
  `parent_class_meeting_id` int(10) unsigned NOT NULL default '0',
  `child_user_id` char(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `sort_order` smallint(6) unsigned NOT NULL default '65535',
  `roles` set('Director','Author','Lecturer','Instructor') default NULL,
  `modified` timestamp NOT NULL,
  PRIMARY KEY  (`parent_class_meeting_id`,`child_user_id`),
  KEY `child_user_id` (`child_user_id`),
  KEY `parent_class_meeting_id` (`parent_class_meeting_id`,`sort_order`))
;

--
-- Table structure for table `link_course_announcement`
--

CREATE TABLE `link_course_announcement` (
  `parent_course_id` char(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `child_announcement_id` int(10) unsigned NOT NULL default '0',
  `modified` timestamp NOT NULL,
  PRIMARY KEY  (`parent_course_id`,`child_announcement_id`))
;

--
-- Table structure for table `link_course_content`
--

CREATE TABLE `link_course_content` (
  `parent_course_id` int(10) unsigned NOT NULL default '0',
  `child_content_id` int(10) unsigned NOT NULL default '0',
  `sort_order` smallint(6) unsigned NOT NULL default '65535',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified` timestamp NOT NULL,
  PRIMARY KEY  (`parent_course_id`,`child_content_id`),
  KEY `child_content_id` (`child_content_id`),
  KEY `parent_course_id` (`parent_course_id`,`sort_order`))
;

--
-- Table structure for table `link_course_course`
--

CREATE TABLE `link_course_course` (
  `parent_course_id` int(10) unsigned NOT NULL default '0',
  `child_course_id` int(10) unsigned NOT NULL default '0',
  `sort_order` smallint(6) unsigned NOT NULL default '65535',
  `modified` timestamp NOT NULL,
  PRIMARY KEY  (`parent_course_id`,`child_course_id`),
  KEY `child_course_id` (`child_course_id`),
  KEY `parent_course_id` (`parent_course_id`,`sort_order`))
;

--
-- Table structure for table `link_course_forum`
--

CREATE TABLE `link_course_forum` (
  `parent_course_id` int(11) NOT NULL default '0',
  `child_forum_id` int(11) NOT NULL default '0',
  `time_period_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`parent_course_id`,`child_forum_id`))
;

--
-- Table structure for table `link_course_objective`
--

CREATE TABLE `link_course_objective` (
  `parent_course_id` int(10) unsigned NOT NULL default '0',
  `child_objective_id` int(10) unsigned NOT NULL default '0',
  `sort_order` smallint(6) unsigned NOT NULL default '65535',
  `relationship` enum('Prerequisite','Objective','Evaluation','Subobjective') default NULL,
  `modified` timestamp NOT NULL,
  PRIMARY KEY  (`parent_course_id`,`child_objective_id`))
;

--
-- Table structure for table `link_course_student`
--

CREATE TABLE `link_course_student` (
  `parent_course_id` int(10) unsigned NOT NULL default '0',
  `child_user_id` char(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `time_period_id` int(10) unsigned NOT NULL default '0',
  `modified` timestamp NOT NULL,
  `teaching_site_id` int(10) NOT NULL default '0',
  `elective` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`parent_course_id`,`child_user_id`,`time_period_id`,`teaching_site_id`),
  KEY `child_user_id` (`child_user_id`))
;

--
-- Table structure for table `link_course_teaching_site`
--

CREATE TABLE `link_course_teaching_site` (
  `parent_course_id` int(10) unsigned NOT NULL default '0',
  `child_teaching_site_id` int(10) unsigned NOT NULL default '0',
  `max_students` int(10) unsigned default NULL,
  `modified` timestamp NOT NULL,
  PRIMARY KEY  (`parent_course_id`,`child_teaching_site_id`))
;

--
-- Table structure for table `link_course_topic`
--

CREATE TABLE `link_course_topic` (
  `parent_course_id` int(10) unsigned NOT NULL default '0',
  `child_topic_id` int(10) unsigned NOT NULL default '0',
  `sort_order` smallint(6) unsigned NOT NULL default '65535',
  `relationship` enum('Prerequisite','Topic','Evaluation','Subtopic') default NULL,
  `modified` timestamp NOT NULL,
  PRIMARY KEY  (`parent_course_id`,`child_topic_id`),
  KEY `child_topic_id` (`child_topic_id`),
  KEY `parent_course_id` (`parent_course_id`,`sort_order`))
;

--
-- Table structure for table `link_course_user`
--

CREATE TABLE `link_course_user` (
  `parent_course_id` int(10) unsigned NOT NULL default '0',
  `child_user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `sort_order` smallint(6) unsigned NOT NULL default '65535',
  `roles` set('Director','Manager','Student Manager','Site Director','Editor','Author','Student Editor','Lecturer','Instructor','Lab Instructor','Librarian','MERC Representative','Teaching Assistant') default NULL,
  `teaching_site_id` int(10) unsigned NOT NULL default '0',
  `modified` timestamp NOT NULL,
  PRIMARY KEY  (`parent_course_id`,`child_user_id`),
  KEY `child_user_id` (`child_user_id`),
  KEY `parent_course_id` (`parent_course_id`,`sort_order`))
;

--
-- Table structure for table `link_course_user_group`
--

CREATE TABLE `link_course_user_group` (
  `parent_course_id` int(10) unsigned NOT NULL default '0',
  `child_user_group_id` int(10) unsigned NOT NULL default '0',
  `time_period_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`parent_course_id`,`child_user_group_id`,`time_period_id`),
  KEY `child_user_group_id` (`child_user_group_id`,`time_period_id`))
;

--
-- Table structure for table `link_eval_eval_question`
--

CREATE TABLE `link_eval_eval_question` (
  `parent_eval_id` int(10) unsigned NOT NULL default '0',
  `child_eval_question_id` int(10) unsigned NOT NULL default '0',
  `label` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `sort_order` smallint(5) unsigned NOT NULL default '0',
  `required` enum('Yes','No') default 'No',
  `grouping` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `graphic_stylesheet` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`parent_eval_id`,`child_eval_question_id`),
  KEY `parent_eval_id` (`parent_eval_id`,`sort_order`),
  KEY `child_eval_question_id` (`child_eval_question_id`))
;

--
-- Table structure for table `link_small_group_user`
--

CREATE TABLE `link_small_group_user` (
  `parent_small_group_id` int(10) unsigned NOT NULL default '0',
  `child_user_id` char(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `roles` set('Director','Author','Lecturer','Instructor','Student','Teaching Assistant') default NULL,
  `modified` timestamp NOT NULL,
  PRIMARY KEY  (`parent_small_group_id`,`child_user_id`),
  KEY `child_user_id` (`child_user_id`))
;

--
-- Table structure for table `link_teaching_site_user`
--

CREATE TABLE `link_teaching_site_user` (
  `parent_teaching_site_id` int(10) unsigned NOT NULL default '0',
  `child_user_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified` timestamp NOT NULL,
  PRIMARY KEY  (`parent_teaching_site_id`,`child_user_id`))
;

--
-- Table structure for table `link_user_group_announcement`
--

CREATE TABLE `link_user_group_announcement` (
  `parent_user_group_id` char(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `child_announcement_id` int(10) unsigned NOT NULL default '0',
  `modified` timestamp NOT NULL,
  PRIMARY KEY  (`parent_user_group_id`,`child_announcement_id`))
;

--
-- Table structure for table `link_user_group_forum`
--

CREATE TABLE `link_user_group_forum` (
  `parent_user_group_id` int(10) NOT NULL default '0',
  `child_forum_id` int(10) NOT NULL default '0',
  PRIMARY KEY  (`parent_user_group_id`,`child_forum_id`))
;

--
-- Table structure for table `link_user_group_user`
--

CREATE TABLE `link_user_group_user` (
  `parent_user_group_id` int(10) unsigned NOT NULL default '0',
  `child_user_id` char(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `modified` timestamp NOT NULL,
  PRIMARY KEY  (`parent_user_group_id`,`child_user_id`),
  KEY `child_user_id` (`child_user_id`))
;

--
-- Table structure for table `location_exception`
--

CREATE TABLE `location_exception` (
  `small_group_id` int(10) unsigned NOT NULL default '0',
  `meeting_date` date NOT NULL default '0000-00-00',
  `new_location` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `new_instructor` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified` timestamp NOT NULL,
  PRIMARY KEY  (`small_group_id`,`meeting_date`))
;

--
-- Table structure for table `merged_eval_results`
--

CREATE TABLE `merged_eval_results` (
  `merged_eval_results_id` int(14) unsigned NOT NULL auto_increment,
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `primary_eval_id` int(14) unsigned NOT NULL default '0',
  `secondary_eval_ids` text CHARACTER SET utf8,
  `modified` timestamp NOT NULL,
  PRIMARY KEY  (`merged_eval_results_id`))
;

--
-- Table structure for table `old_link_course_user`
--

CREATE TABLE `old_link_course_user` (
  `old_link_course_user_id` int(10) NOT NULL auto_increment,
  `parent_course_id` int(10) unsigned NOT NULL default '0',
  `child_user_id` char(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `sort_order` smallint(6) unsigned NOT NULL default '65535',
  `roles` set('Director','Editor','Author','Lecturer','Instructor','Cooperating Instructor','Teaching Assistant','Lab Instructor','Librarian','MERC Representative') default NULL,
  `modified` timestamp NOT NULL,
  `created` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`old_link_course_user_id`),
  KEY `child_user_id` (`child_user_id`),
  KEY `parent_course_id` (`parent_course_id`,`sort_order`))
;

--
-- Table structure for table `small_group`
--

CREATE TABLE `small_group` (
  `small_group_id` int(10) unsigned NOT NULL auto_increment,
  `course_id` int(10) unsigned NOT NULL default '0',
  `time_period_id` int(10) unsigned NOT NULL default '0',
  `label` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `meeting_type` enum('Lecture','Small Group','Conference','Laboratory','Examination','Reception','Luncheon','Unknown') NOT NULL default 'Unknown',
  `instructor` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `location` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `max_students` smallint(6) default NULL,
  `modified` timestamp NOT NULL,
  PRIMARY KEY  (`small_group_id`),
  KEY `course_id` (`course_id`,`meeting_type`))
;

--
-- Table structure for table `stylesheet`
--

CREATE TABLE `stylesheet` (
  `stylesheet_id` int(10) unsigned NOT NULL auto_increment,
  `stylesheet_type_id` int(10) unsigned NOT NULL default '0',
  `label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `body` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8,
  `modified` timestamp NOT NULL,
  PRIMARY KEY  (`stylesheet_id`),
  UNIQUE KEY `label` (`label`),
  KEY `stylesheet_type_id` (`stylesheet_type_id`))
;

--
-- Table structure for table `teaching_site`
--

CREATE TABLE `teaching_site` (
  `teaching_site_id` int(10) unsigned NOT NULL auto_increment,
  `site_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `site_city_state` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `modified` timestamp NOT NULL,
  `body` text CHARACTER SET utf8,
  PRIMARY KEY  (`teaching_site_id`),
  KEY `site_name` (`site_name`))
;

--
-- Table structure for table `time_period`
--

CREATE TABLE `time_period` (
  `time_period_id` int(10) unsigned NOT NULL auto_increment,
  `academic_year` varchar(9) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '2000-2001',
  `period` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default '',
  `start_date` date default NULL,
  `end_date` date default NULL,
  PRIMARY KEY  (`time_period_id`))
;


--
-- Insert 'eternity' time period into table (used by 'My Groups')
--

insert into time_period (academic_year, period, start_date, end_date) values ('', 'eternity', now(), '2036-10-31')
;


--
-- Table structure for table `tracking`
--

CREATE TABLE `tracking` (
  `tracking_id` int(10) unsigned NOT NULL auto_increment,
  `course_id` int(10) unsigned NOT NULL default '0',
  `user_group_id` int(10) unsigned default '0',
  `content_id` int(10) unsigned NOT NULL default '0',
  `start_date` date default NULL,
  `end_date` date default NULL,
  `page_views` int(10) unsigned default '0',
  `unique_visitors` int(10) unsigned default '0',
  `sort_order` int(10) unsigned default '999999999',
  `time_period_id` int(10) default '0',
  PRIMARY KEY  (`tracking_id`),
  KEY `course_id` (`course_id`))
;

--
-- Table structure for table `user_group`
--

CREATE TABLE `user_group` (
  `user_group_id` int(10) unsigned NOT NULL auto_increment,
  `label` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci default NULL,
  `homepage_info` set('Hot Content','Announcements','Evals','Discussion') default NULL,
  `schedule_flag_time` datetime default NULL,
  `modified` timestamp NOT NULL,
  `sub_group` enum('Yes','No') default 'No',
  `description` mediumtext CHARACTER SET utf8,
  `sort_order` tinyint(3) unsigned default NULL,
  PRIMARY KEY  (`user_group_id`))
;

insert into user_group values (1,'School Administrators','Announcements',NULL,now(),'No',NULL,10)
;
insert into user_group values (2,'Evaluations Administrators','Announcements',NULL,now(),'No',NULL, 20)
;
insert into user_group values (3,'Schoolwide Announcements','Announcements',NULL,now(),'No',NULL, 30)
;
insert into link_user_group_user values (1,'##CHILD_USER_ID##',now())
;

--
-- now grant permissions
--

GRANT SELECT ON `##DB_NAME##`.* TO '##DEFAULT_USER##'@'%'
;    
GRANT SELECT, INSERT, UPDATE ON `##DB_NAME##`.`eval_results_graphics` TO '##DEFAULT_USER##'@'%'
;
GRANT INSERT ON `##DB_NAME##`.`eval_response` TO '##DEFAULT_USER##'@'%'
;
GRANT SELECT, INSERT, UPDATE ON `##DB_NAME##`.`stylesheet` TO '##DEFAULT_USER##'@'%'
;
GRANT SELECT, INSERT, UPDATE ON `##DB_NAME##`.`default_stylesheet` TO '##DEFAULT_USER##'@'%'
;
GRANT INSERT ON `##DB_NAME##`.`eval_completion` TO '##DEFAULT_USER##'@'%'
;
GRANT SELECT, INSERT, UPDATE, DELETE ON `##DB_NAME##`.`hot_content_cache` TO '##DEFAULT_USER##'@'%'
;
GRANT SELECT, INSERT, UPDATE, DELETE ON `##DB_NAME##`.`eval_save_data` TO '##DEFAULT_USER##'@'%'
;
GRANT SELECT, INSERT, UPDATE ON `##DB_NAME##`.`eval_mergedresults_graphics` TO '##DEFAULT_USER##'@'%'
;

GRANT SELECT, INSERT, UPDATE, DELETE ON `##DB_NAME##`.`link_course_student` TO '##CONTENT_USER##'@'%'
;
GRANT SELECT, INSERT, UPDATE, DELETE ON `##DB_NAME##`.`user_group` TO '##CONTENT_USER##'@'%'
;
GRANT SELECT, INSERT, UPDATE, DELETE ON `##DB_NAME##`.`teaching_site` TO '##CONTENT_USER##'@'%'
;
GRANT SELECT, INSERT, UPDATE, DELETE ON `##DB_NAME##`.`announcement` TO '##CONTENT_USER##'@'%'
;
GRANT SELECT, INSERT, UPDATE, DELETE ON `##DB_NAME##`.`course` TO '##CONTENT_USER##'@'%'
;
GRANT SELECT, INSERT, UPDATE, DELETE ON `##DB_NAME##`.`link_user_group_user` TO '##CONTENT_USER##'@'%'
;
GRANT SELECT, INSERT, UPDATE, DELETE ON `##DB_NAME##`.`link_course_forum` TO '##CONTENT_USER##'@'%'
;
GRANT SELECT, INSERT, UPDATE, DELETE ON `##DB_NAME##`.`link_user_group_forum` TO '##CONTENT_USER##'@'%'
;
GRANT SELECT, INSERT, UPDATE, DELETE ON `##DB_NAME##`.`link_course_user` TO '##CONTENT_USER##'@'%'
;
GRANT SELECT, INSERT, UPDATE, DELETE ON `##DB_NAME##`.`eval` TO '##EVAL_USER##'@'%'
;
GRANT SELECT, INSERT, UPDATE, DELETE ON `##DB_NAME##`.`eval_question` TO '##EVAL_USER##'@'%'
;
GRANT SELECT, INSERT, UPDATE, DELETE ON `##DB_NAME##`.`link_eval_eval_question` TO '##EVAL_USER##'@'%'
;
GRANT SELECT, INSERT, UPDATE, DELETE ON `##DB_NAME##`.`merged_eval_results` TO '##EVAL_USER##'@'%'
;
GRANT SELECT, INSERT, UPDATE, DELETE ON `##DB_NAME##`.`link_course_teaching_site` TO '##CONTENT_USER##'@'%'
;
GRANT SELECT, INSERT, UPDATE, DELETE ON `##DB_NAME##`.`link_course_user_group` TO '##CONTENT_USER##'@'%'
;
GRANT SELECT, INSERT, UPDATE, DELETE ON `##DB_NAME##`.`link_course_content` TO '##CONTENT_USER##'@'%'
;
GRANT SELECT, INSERT, UPDATE, DELETE ON `##DB_NAME##`.`link_teaching_site_user` TO '##CONTENT_USER##'@'%'
;
GRANT SELECT, INSERT, UPDATE, DELETE ON `##DB_NAME##`.`tracking` TO '##CONTENT_USER##'@'%'
;
GRANT SELECT, INSERT, UPDATE, DELETE ON `##DB_NAME##`.`homepage_category` TO '##CONTENT_USER##'@'%'
;
GRANT SELECT, INSERT, UPDATE, DELETE ON `##DB_NAME##`.`link_course_objective` TO '##CONTENT_USER##'@'%'
;
GRANT SELECT, INSERT, UPDATE, DELETE ON `##DB_NAME##`.`class_meeting` TO '##CONTENT_USER##'@'%'
;
GRANT SELECT, INSERT, UPDATE, DELETE ON `##DB_NAME##`.`homepage_course` TO '##CONTENT_USER##'@'%'
;
GRANT SELECT, INSERT, UPDATE, DELETE ON `##DB_NAME##`.`time_period` TO '##CONTENT_USER##'@'%'
;
GRANT SELECT, INSERT, UPDATE, DELETE ON `##DB_NAME##`.`link_user_group_announcement` TO '##CONTENT_USER##'@'%'
;
GRANT SELECT, INSERT, UPDATE, DELETE ON `##DB_NAME##`.`link_course_announcement` TO '##CONTENT_USER##'@'%'
;
GRANT SELECT, INSERT, UPDATE, DELETE ON `##DB_NAME##`.`link_class_meeting_content` TO '##CONTENT_USER##'@'%'
;


