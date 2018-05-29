package rus.store.TenderStore.HN;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import rus.store.TenderStore.domain.Contact;

public class HibernateUtil {

	private static final SessionFactory sessionFactory = buildSessionFactory();

	private static SessionFactory buildSessionFactory() {
		try {
			Configuration configuration = new Configuration();
			configuration.configure();
			configuration.addAnnotatedClass(Contact.class);
			return configuration
					.buildSessionFactory(new StandardServiceRegistryBuilder()
							.applySettings(configuration.getProperties())
							.build());
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(
					"There was an error building the factory");
		}
	}

	public static SessionFactory getSessionFactory() {
		
		return sessionFactory;
	}
}
