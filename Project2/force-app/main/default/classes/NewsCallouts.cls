public with sharing class NewsCallouts {

    //returns articles based on the url received
    public static Map<String,Object> callouts(String url){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            
            List<Object> articles = (List<Object>) results.get('articles');
            Map<String, Object> article = new Map<String, Object>();
            Map<String, Object> articleMap = new Map<String, Object>();
            
            for (Integer i = 0; i < 20 ; i++){
                article = (Map<String, Object>)articles.get(i);

                String title = (String)article.get('title');
                String author = (String)article.get('author');
                String description = (String)article.get('description');
                String articleUrl = (String)article.get('url');
                String publishedDate = (String)article.get('publishedAt');
                

                articleMap.put('title', title);
                articleMap.put('author', author);
                articleMap.put('description', description);
                articleMap.put('articleUrl', articleUrl);
                articleMap.put('publishedDate', publishedDate);

                //System.debug(articleMap.get('title'));
           }
            
            return articleMap;
        }
        return null;
    }
    
    @AuraEnabled
    public static Map<String,Object> getTopHeadlines() {
        String topHeadlinesUrl = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=925e099242a34913991b9efd7cb6adf9';
        return callouts(topHeadlinesUrl);
    } 

    @AuraEnabled
    public static Map<String,Object> getCrypto() {
        String topHeadlinesUrl = 'https://newsapi.org/v2/everything?q=crypto&apiKey=925e099242a34913991b9efd7cb6adf9';
        return callouts(topHeadlinesUrl);
    }

    @AuraEnabled
    public static Map<String,Object> getProgramming() {
        String topHeadlinesUrl = 'https://newsapi.org/v2/everything?q=programming&apiKey=925e099242a34913991b9efd7cb6adf9';
        return callouts(topHeadlinesUrl);
    }

    @AuraEnabled
    public static Map<String,Object> getSalesforce() {
        String topHeadlinesUrl = 'https://newsapi.org/v2/everything?q=salesforce&apiKey=925e099242a34913991b9efd7cb6adf9';
        return callouts(topHeadlinesUrl);
    }
    
}
