package kr.kh.RLab.utils;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;

public class CustomDateDeserializer extends JsonDeserializer<Date> {
    private SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");

    @Override
    public Date deserialize(JsonParser jsonparser, DeserializationContext context) throws IOException {
        String dateString = jsonparser.getText();
        if (dateString.isEmpty()) { // 빈 문자열인 경우 null 반환
            return null;
        }
        try {
            return formatter.parse(dateString);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }
}
