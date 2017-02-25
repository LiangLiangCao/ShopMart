package edu.zju.cst;

import edu.zju.cst.bean.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * Created by Liang on 19/02/2017.
 */
@Controller
public class HiController {

    @RequestMapping(value = "/hi", method = RequestMethod.GET)
    public String index() {
        return "index";
    }

}
