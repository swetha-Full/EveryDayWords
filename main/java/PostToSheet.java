import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.api.services.sheets.v4.model.UpdateValuesResponse;
import com.google.api.services.sheets.v4.model.ValueRange;

@WebServlet(name = "PostToSheet", urlPatterns = { "/PostToSheet" })
public class PostToSheet extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		boolean status = true;
		String word = req.getParameter("word");
		String meaning = req.getParameter("meaning");
		String source = req.getParameter("source");
		HttpSession session = req.getSession(true);
		session.setAttribute("word", word);
		session.setAttribute("meaning", meaning);
		session.setAttribute("source", source);
		PrintWriter out = resp.getWriter();
		out.println(status);
		List<List<Object>> values = Arrays.asList(Arrays.asList(word, meaning, source)

		);
		ValueRange body = new ValueRange().setValues(values);
		UpdateValuesResponse result = service.spreadsheets().values()
				.update("1K3quW46lnYMNOnY6hk6rgbGauycYkq8vajUC-b2ovpk", "Sheet1!B1", body)
				.setValueInputOption("USER_ENTERED").execute();
		System.out.printf("%d cells updated.", result.getUpdatedCells());
	}

}
