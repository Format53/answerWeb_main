package cn.edu.lingnan.controller;

import cn.edu.lingnan.pojo.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import redis.clients.jedis.Jedis;


@Controller
public class FalseController extends BaseController{

    @ResponseBody
    @RequestMapping(value = "user/insertFalse/{questionId}")
    public void insertFalseRecord(@PathVariable int questionId){
        Jedis jedis=new Jedis("localhost");
        System.out.println("jedis连接成功");
        System.out.println(jedis.ping());
        User userLogin= (User) super.session.getAttribute("user");
        Integer userLoginNo=userLogin.getUserno();
        jedis.lpush("falseQuestions"+userLoginNo, String.valueOf(questionId));
    }

    @RequestMapping(value = "user/showFalseBook")
    public String toFalseBook(){
        return "user/falseBook";
    }
}
