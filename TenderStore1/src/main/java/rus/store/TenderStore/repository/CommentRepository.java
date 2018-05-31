package rus.store.TenderStore.repository;

import java.util.List;

import rus.store.TenderStore.domain.Comment;

public interface CommentRepository {
	
	public void addComment(Comment cmnt);
	
	public List<Comment> getCommentsOfContact(String id);

	public void delete(int id);
	
	public void updateComment(Comment cmnt, String owner);

	public Comment getCommentById(int id);
}
