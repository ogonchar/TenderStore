package rus.store.TenderStore.service;

import java.util.List;

import rus.store.TenderStore.domain.Comment;

public interface CommentService {
	public void addComment(Comment cmnt);
	
	public List<Comment> getCommentsOfContact(String id);
	
	public void delete(int id1);
	
	public void updateComment(Comment cmnt, String owner);

	public Comment getCommentById(int id);
}
