package com.file.handling;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/upload")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		maxFileSize = 1024 * 1024 * 10, // 10 MB
		maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class upload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.isNew()) {
			session.setAttribute("saved", "new");
		}
		Part getfile = request.getPart("file");
		try {
			String fname = getSubmittedFile(getfile);

			String loc;
			for (Part part : request.getParts()) {
				if (fname.endsWith(".jpg") || fname.endsWith(".jpeg")) {
					loc = getServletContext().getRealPath("/Images");
				} else {
					loc = getServletContext().getRealPath("/Text");
				}
				loc += "\\" + fname;
				part.write(loc);
				session.setAttribute("saved", "Upload Successfully");
			}
		} catch (Exception e) {
			session.setAttribute("saved", "Upload Error");
		}
		RequestDispatcher rd = request.getRequestDispatcher("FileUpload.jsp");
		rd.forward(request, response);

	}

	private String getSubmittedFile(Part getfile) {

		for (String cd : getfile.getHeader("content-disposition").split(";")) {
			System.out.println(cd);
			if (cd.trim().startsWith("filename")) {
				String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");

				return fileName;
			}
		}
		return null;
	}
}
