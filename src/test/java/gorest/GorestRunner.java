package gorest;

import com.intuit.karate.junit5.Karate;

class GorestRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("gorest").relativeTo(getClass());
    }    

}
