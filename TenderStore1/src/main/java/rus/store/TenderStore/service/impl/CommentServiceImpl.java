package rus.store.TenderStore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import rus.store.TenderStore.domain.Comment;
import rus.store.TenderStore.repository.CommentRepository;
import rus.store.TenderStore.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService{
	@Autowired
	CommentRepository commentRepository;
	
	public void addComment(Comment cmnt) {
		commentRepository.addComment(cmnt);
	}
	public List<Comment> getCommentsOfContact(String id){
		return commentRepository.getCommentsOfContact(id);
	}
	@Override
	public void delete(int id) {
		commentRepository.delete(id);
		
	}
	
	public void updateComment(Comment cmnt, String owner) {
		commentRepository.updateComment(cmnt, owner);
	}
	
	public Comment getCommentById(int id) {
		return commentRepository.getCommentById(id);
		
	}
}
