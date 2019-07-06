select * from comment_count left outer join board_comment on 
(comment_count.no_comment = board_comment.comment_num) 
where comment_count.no_board = 4;
