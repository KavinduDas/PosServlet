/*
 * package service; // Adjust to 'services' if that's your package
 * 
 * import model.customer; import org.junit.jupiter.api.BeforeEach; import
 * org.junit.jupiter.api.Test; import org.mockito.InjectMocks; import
 * org.mockito.Mock; import org.mockito.MockitoAnnotations; import
 * utils.DB_connect;
 * 
 * import java.sql.Connection; import java.sql.ResultSet; import
 * java.sql.Statement;
 * 
 * import model.customer; import org.junit.jupiter.api.BeforeEach; import
 * org.junit.jupiter.api.Test; import org.mockito.InjectMocks; import
 * org.mockito.Mock; import org.mockito.MockitoAnnotations; import
 * utils.DB_connect;
 * 
 * import java.sql.Connection; import java.sql.ResultSet; import
 * java.sql.Statement;
 * 
 * public class customerServiceTest {
 * 
 * @Mock private Connection mockConnection;
 * 
 * @Mock private Statement mockStatement;
 * 
 * @Mock private ResultSet mockResultSet;
 * 
 * @InjectMocks private customerService customerService;
 * 
 * @BeforeEach public void setUp() throws Exception { // Initialize mocks
 * MockitoAnnotations.openMocks(this);
 * 
 * // Mock DB_connect.getConnection()
 * when(DB_connect.getConnection()).thenReturn(mockConnection);
 * when(mockConnection.createStatement()).thenReturn(mockStatement); }
 * 
 * @Test public void testValidate_SuccessfulLogin() throws Exception { //
 * Arrange customer cus = new customer(); cus.setEmail("test@example.com");
 * cus.setPassword("password123");
 * 
 * // Mock database query when(mockStatement.
 * executeQuery("SELECT * FROM cashier WHERE email = 'test@example.com' AND password = 'password123'"
 * )) .thenReturn(mockResultSet); when(mockResultSet.next()).thenReturn(true);
 * 
 * // Act boolean result = customerService.validate(cus);
 * 
 * // Assert assertTrue(result, "Login should be successful");
 * 
 * // Verify interactions verify(mockStatement).
 * executeQuery("SELECT * FROM cashier WHERE email = 'test@example.com' AND password = 'password123'"
 * ); verify(mockResultSet).next(); }
 * 
 * @Test public void testValidate_UnsuccessfulLogin() throws Exception { //
 * Arrange customer cus = new customer(); cus.setEmail("test@example.com");
 * cus.setPassword("wrongpassword");
 * 
 * // Mock database query when(mockStatement.
 * executeQuery("SELECT * FROM cashier WHERE email = 'test@example.com' AND password = 'wrongpassword'"
 * )) .thenReturn(mockResultSet); when(mockResultSet.next()).thenReturn(false);
 * 
 * // Act boolean result = customerService.validate(cus);
 * 
 * // Assert assertFalse(result, "Login should fail");
 * 
 * // Verify interactions verify(mockStatement).
 * executeQuery("SELECT * FROM cashier WHERE email = 'test@example.com' AND password = 'wrongpassword'"
 * ); verify(mockResultSet).next(); }
 * 
 * @Test public void testRegCustomer_SuccessfulRegistration() throws Exception {
 * // Arrange customer cus = new customer();
 * cus.setEmail("newuser@example.com"); cus.setName("New User");
 * cus.setPassword("password123"); cus.setConfirm_password("password123");
 * 
 * // Mock database update
 * when(mockStatement.executeUpdate(anyString())).thenReturn(1); // 1 row
 * affected
 * 
 * // Act customerService.regCustomer(cus);
 * 
 * // Assert: Verify the query was executed verify(mockStatement).
 * executeUpdate("INSERT INTO cashier VALUES ('newuser@example.com','New User','password123','password123')"
 * ); }
 * 
 * @Test public void testRegCustomer_SQLException() throws Exception { //
 * Arrange customer cus = new customer(); cus.setEmail("newuser@example.com");
 * cus.setName("New User"); cus.setPassword("password123");
 * cus.setConfirm_password("password123");
 * 
 * // Mock database to throw SQLException
 * when(mockStatement.executeUpdate(anyString())).thenThrow(new
 * SQLException("Database error"));
 * 
 * // Act customerService.regCustomer(cus);
 * 
 * // Assert: Verify the query was attempted verify(mockStatement).
 * executeUpdate("INSERT INTO cashier VALUES ('newuser@example.com','New User','password123','password123')"
 * ); // Note: The method catches the exception and logs it, so no exception is
 * thrown to the test }
 * 
 * @Test public void testGetCustomerByEmailAndPassword_Success() throws
 * Exception { // Arrange String email = "test@example.com"; String password =
 * "password123";
 * 
 * // Mock database query when(mockStatement.
 * executeQuery("SELECT * FROM cashier WHERE email = 'test@example.com' AND password = 'password123'"
 * )) .thenReturn(mockResultSet); when(mockResultSet.next()).thenReturn(true);
 * when(mockResultSet.getString("email")).thenReturn(email);
 * when(mockResultSet.getString("name")).thenReturn("Test User");
 * when(mockResultSet.getString("password")).thenReturn(password);
 * 
 * // Act customer result = customerService.getCustomerByEmailAndPassword(email,
 * password);
 * 
 * // Assert assertNotNull(result, "Customer should not be null");
 * assertEquals(email, result.getEmail(), "Email should match");
 * assertEquals("Test User", result.getName(), "Name should match");
 * assertEquals(password, result.getPassword(), "Password should match");
 * 
 * // Verify interactions verify(mockStatement).
 * executeQuery("SELECT * FROM cashier WHERE email = 'test@example.com' AND password = 'password123'"
 * ); verify(mockResultSet).next(); verify(mockResultSet).getString("email");
 * verify(mockResultSet).getString("name");
 * verify(mockResultSet).getString("password"); } }
 */