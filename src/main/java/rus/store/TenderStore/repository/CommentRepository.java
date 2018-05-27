package rus.store.TenderStore.repository;

import java.util.List;

import rus.store.TenderStore.domain.Comment;

public interface CommentRepository {
	
	public void addComment(Comment cmnt);
	
	public List<Comment> getCommentsOfContact(String id);

	public void delete(int id);
	
}
