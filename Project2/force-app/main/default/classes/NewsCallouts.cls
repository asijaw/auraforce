public with sharing class NewsCallouts {

    //returns artciles based on the url recieved
    public static List<Object> callouts(String url){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        List<Object> articles = new List<Object>();
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            articles = (List<Object>) results.get('articles');
            //System.debug('Received the following articles:');
            // for (Object article: articles) {
            //     System.debug(article);
            // }
            //System.debug(articles[0]);
        }
        return articles;
    }
    
    @AuraEnabled
    public static List<Object> getTopHeadlinesCallout() {
        String topHeadlinesUrl = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=925e099242a34913991b9efd7cb6adf9';
        return callouts(topHeadlinesUrl);
    } 

    @AuraEnabled
    public static List<Object> getCryptoCallout() {
        String topHeadlinesUrl = 'https://newsapi.org/v2/everything?q=crypto&apiKey=925e099242a34913991b9efd7cb6adf9';
        return callouts(topHeadlinesUrl);
    }

    @AuraEnabled
    public static List<Object> getProgrammingCallout() {
        String topHeadlinesUrl = 'https://newsapi.org/v2/everything?q=programming&apiKey=925e099242a34913991b9efd7cb6adf9';
        return callouts(topHeadlinesUrl);
    }

    @AuraEnabled
    public static List<Object> getSalesforceCallout() {
        String topHeadlinesUrl = 'https://newsapi.org/v2/everything?q=salesforce&apiKey=925e099242a34913991b9efd7cb6adf9';
        return callouts(topHeadlinesUrl);
    }
    
}
