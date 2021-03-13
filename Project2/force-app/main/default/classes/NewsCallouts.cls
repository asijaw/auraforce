public with sharing class NewsCallouts {

    //returns articles based on the url received
    public static List<Object> callouts(String url){
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
            
            // for(List<Object> x : articles) {
            //     System.debug((Map<String, Object>)articles.get('author'));
            // }

            return articles;
            
        }
        return null;
    }
    @AuraEnabled
    public static List<Object> getTech(){
        String topHeadlinesUrl = 'https://newsapi.org/v2/top-headlines?q=tech&apiKey=925e099242a34913991b9efd7cb6adf9';
        return callouts(topHeadlinesUrl);
    }

    @AuraEnabled
    public static List<Object> getCrypto(){
        String cryptoUrl = 'https://newsapi.org/v2/everything?q=crypto&apiKey=925e099242a34913991b9efd7cb6adf9';
        return callouts(cryptoUrl);
    }

    @AuraEnabled
    public static List<Object> getProgramming(){
        String programmingUrl = 'https://newsapi.org/v2/everything?q=programming&apiKey=925e099242a34913991b9efd7cb6adf9';
        return callouts(programmingUrl);
    }
    
    @AuraEnabled
    public static List<Object> getSalesforce(){
        String salesforceUrl = 'https://newsapi.org/v2/everything?q=salesforce&apiKey=925e099242a34913991b9efd7cb6adf9';
        return callouts(salesforceUrl);
    }
    @AuraEnabled
    public static List<Article__c> getMyArticles(){
        //User currentUser = [SELECT Id, ContactId FROM User WHERE Id=:UserInfo.getUserId()]
        User currentUser = [SELECT Id FROM User WHERE Id='0055Y00000ECcjOQAT'];
        List<Article__c> articles = [SELECT Id, Title__c, Author__c, Description__c, Content__c FROM Article__c];
        return articles;
    }
    @AuraEnabled
    public static Article__c saveItem(Article__c article){
        upsert article;
        return article;
    }
}
