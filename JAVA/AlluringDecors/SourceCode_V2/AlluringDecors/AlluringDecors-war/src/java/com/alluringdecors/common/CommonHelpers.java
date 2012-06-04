/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alluringdecors.common;

import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

/**
 *
 * @author Administrator
 */
public class CommonHelpers {

    public static String Truncate(String input, int length) {
        input = input.trim();
        if (input.length() > length) {
            input = input.substring(0, length);
        }

        int lastPos = input.lastIndexOf(" ");
        if (lastPos == -1) {
            return "...";
        }
        return input.substring(0, lastPos) + "...";
    }

    public static String createImageFileName(String extension) {
        Date date = new Date();
        String timeStamp = String.valueOf(date.getTime());
        return timeStamp + "." + extension;
    }

    public static String getFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    public static boolean uploadFile(HttpServletRequest request, Part part, String oldFileName, HolderHepler holder) {
        try {
            InputStream is = request.getPart(part.getName()).getInputStream();
            int i = is.available();
            byte[] b = new byte[i];
            is.read(b);
            String fileName = getFileName(part);
            if (!"".equals(fileName)) {
                String extension = fileName.substring(fileName.lastIndexOf('.') + 1);
                holder.setValue(createImageFileName(extension));
                FileOutputStream os = new FileOutputStream(request.getRealPath("/") + "\\images\\uploads\\" + (String) holder.getValue());
                os.write(b);
                os.close();
            } else {
                holder.setValue(oldFileName);
            }
            is.close();
            return true;
        } catch (Exception ex) {
            Logger.getLogger(CommonHelpers.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public static String formatDate(Date date) {
        date = (date == null ? new Date() : date);
        SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
	//DateFormat shortDf = DateFormat.getDateInstance(DateFormat.SHORT);
        return format.format(date);
    }

    public static Date parseDate(String date){
	try
	{
//	    DateFormat shortDf = DateFormat.getDateInstance(DateFormat.SHORT);
	    SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
	    date = (date == null ? format.format(new Date()) : date);
	    return format.parse(date);
	}
	catch (ParseException ex)
	{
	    Logger.getLogger(CommonHelpers.class.getName()).log(Level.SEVERE, null, ex);
	    return new Date();
	}
    }

    public static String getHTML(String urlToRead) {
        String result = "";
        try {
            File file = new File(urlToRead);

            InputStreamReader streamReader = new InputStreamReader(new FileInputStream(file));

            BufferedReader br = new BufferedReader(streamReader);

            String line;
            while ((line = br.readLine()) != null) {
                result += line;
            }
        } catch (Exception ex) {
            Logger.getLogger(CommonHelpers.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
}
