
drop table db_tool.database_user_favorite;
create table  db_tool.database_user_favorite like sitebuilt.database_user_favorite;
insert into db_tool.database_user_favorite select * from sitebuilt.database_user_favorite;

drop table db_tool.database_user_info;
create table  db_tool.database_user_info like sitebuilt.database_user_info;
insert into db_tool.database_user_info select * from sitebuilt.database_user_info;

drop table db_tool.database_user_sql_history;
create table  db_tool.database_user_sql_history like sitebuilt.database_user_sql_history;
insert into db_tool.database_user_sql_history select * from sitebuilt.database_user_sql_history;




insert into db_tool.db_tools_menus (id, title, name, page_url, icon, open_type, extend, parent_id, max_open, is_desk, user_id, is_necessary, is_public, create_time, update_time, client_ip, sort) values (10, '主题', '主题', 'theme', 'fa-television', 1, 0, 15, -1, 1, -1, 1, 1, '2018-09-26 17:39:55', '2018-09-26 17:39:55', null, 0);
insert into db_tool.db_tools_menus (id, title, name, page_url, icon, open_type, extend, parent_id, max_open, is_desk, user_id, is_necessary, is_public, create_time, update_time, client_ip, sort) values (11, '基本说明', '基本说明', '/winUi/demo/introduce', 'fa-info-circle', 2, 0, 0, -1, 1, -1, 1, 1, '2018-09-26 17:39:55', '2018-09-26 17:39:55', null, 2);
insert into db_tool.db_tools_menus (id, title, name, page_url, icon, open_type, extend, parent_id, max_open, is_desk, user_id, is_necessary, is_public, create_time, update_time, client_ip, sort) values (12, '菜单管理', '菜单管理', '/winUi/menu/list_iframe', 'fa-clock-o', 2, 0, 15, -1, 1, -1, 1, 1, '2018-09-26 17:39:55', '2018-09-26 17:39:55', null, 3);
insert into db_tool.db_tools_menus (id, title, name, page_url, icon, open_type, extend, parent_id, max_open, is_desk, user_id, is_necessary, is_public, create_time, update_time, client_ip, sort) values (13, '点赞', '点赞', 'https://github.com/hammerLei/web-DB-tools', 'fa-thumbs-up', 3, 0, 0, -1, 1, -1, 0, 1, '2018-09-26 17:39:55', '2018-09-26 17:39:55', null, 11);
insert into db_tool.db_tools_menus (id, title, name, page_url, icon, open_type, extend, parent_id, max_open, is_desk, user_id, is_necessary, is_public, create_time, update_time, client_ip, sort) values (14, 'Chime Db', 'Chime Db', '/operate', 'fa-database', 2, 0, 0, -1, 1, -1, 1, 1, '2018-09-26 17:39:55', '2018-09-26 17:39:55', null, 8);
insert into db_tool.db_tools_menus (id, title, name, page_url, icon, open_type, extend, parent_id, max_open, is_desk, user_id, is_necessary, is_public, create_time, update_time, client_ip, sort) values (15, '系统设置', '系统设置', null, 'fa-cog', 1, 0, 0, -1, 0, -1, 1, 0, '2018-09-26 17:39:55', '2018-09-26 17:39:55', null, 1);
insert into db_tool.db_tools_menus (id, title, name, page_url, icon, open_type, extend, parent_id, max_open, is_desk, user_id, is_necessary, is_public, create_time, update_time, client_ip, sort) values (16, '角色管理', '角色管理', '/winUi/role/list', 'fa-user', 2, 0, 15, -1, 1, -1, 1, 0, '2018-09-26 17:39:55', '2018-09-26 17:39:55', null, 4);
insert into db_tool.db_tools_menus (id, title, name, page_url, icon, open_type, extend, parent_id, max_open, is_desk, user_id, is_necessary, is_public, create_time, update_time, client_ip, sort) values (17, 'FontAwesome第三方LOGO', 'FontAwesome第三方LOGO', null, 'fa-edge', 1, 0, 0, -1, 0, -1, 1, 0, '2018-09-26 17:39:55', '2018-09-26 17:39:55', null, 12);
insert into db_tool.db_tools_menus (id, title, name, page_url, icon, open_type, extend, parent_id, max_open, is_desk, user_id, is_necessary, is_public, create_time, update_time, client_ip, sort) values (18, 'Chime Tools', 'Chime Tools', null, '/images/logo_100.png', 1, 0, 0, -1, 0, -1, 1, 0, '2018-09-26 17:39:55', '2018-09-26 17:39:55', null, 5);
insert into db_tool.db_tools_menus (id, title, name, page_url, icon, open_type, extend, parent_id, max_open, is_desk, user_id, is_necessary, is_public, create_time, update_time, client_ip, sort) values (19, 'Chime Jira', 'Chime Jira', 'https://jira.chimewiki.me/', 'fa-indent', 3, 0, 18, -1, 1, -1, 1, 1, '2018-09-26 17:44:53', '2018-09-26 17:44:53', null, 6);
insert into db_tool.db_tools_menus (id, title, name, page_url, icon, open_type, extend, parent_id, max_open, is_desk, user_id, is_necessary, is_public, create_time, update_time, client_ip, sort) values (20, 'Chime Wiki', 'Chime Wiki', 'https://jira.chimewiki.me/', 'fa-wikipedia-w', 3, 0, 18, -1, 1, -1, 1, 1, '2018-09-26 17:44:53', '2018-09-26 17:44:53', null, 7);
insert into db_tool.db_tools_menus (id, title, name, page_url, icon, open_type, extend, parent_id, max_open, is_desk, user_id, is_necessary, is_public, create_time, update_time, client_ip, sort) values (21, 'Google', 'Google', 'https://www.google.cn/', 'fa-google', 3, 0, 0, -1, 1, -1, 1, 1, '2018-09-26 17:44:53', '2018-09-26 17:44:53', null, 9);
insert into db_tool.db_tools_menus (id, title, name, page_url, icon, open_type, extend, parent_id, max_open, is_desk, user_id, is_necessary, is_public, create_time, update_time, client_ip, sort) values (22, 'Baidu', 'Baidu', 'https://baidu.com/', 'fa-paw', 3, 0, 0, -1, 1, -1, 1, 1, '2018-09-26 17:44:53', '2018-09-26 17:44:53', null, 10);
