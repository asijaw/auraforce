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
    public static List<Object> getApple(){
        String topHeadlinesUrl = 'https://newsapi.org/v2/everything?q=apple&apiKey=9cb721f30c7a45e48bc180e9cea91723';
        return callouts(topHeadlinesUrl);
    }

    @AuraEnabled
    public static List<Object> getCrypto(){
        String cryptoUrl = 'https://newsapi.org/v2/everything?q=crypto&apiKey=9cb721f30c7a45e48bc180e9cea91723';
        return callouts(cryptoUrl);
    }

    @AuraEnabled
    public static List<Object> getProgramming(){
        String programmingUrl = 'https://newsapi.org/v2/everything?q=programming&apiKey=9cb721f30c7a45e48bc180e9cea91723';
        return callouts(programmingUrl);
    }
    
    @AuraEnabled
    public static List<Object> getSalesforce(){
        String salesforceUrl = 'https://newsapi.org/v2/everything?q=salesforce&apiKey=9cb721f30c7a45e48bc180e9cea91723';
        return callouts(salesforceUrl);
    }
    @AuraEnabled
    public static List<Object> getMyArticles(){
        //User currentUser = [SELECT Id, ContactId FROM User WHERE Id=:UserInfo.getUserId()]
        //User currentUser = [SELECT Id FROM User WHERE Id='0055Y00000ECcjOQAT'];
        List<Article__c> articles = [SELECT Id, Title__c, Author__c, Description__c, Content__c, Article_Link__c FROM Article__c];
        List<Object> v1 = (List<Object>) articles;
        return v1;
    }
    @AuraEnabled
    public static Article__c saveItem(Map<Object,Object> article){
        Article__c newArticle = new Article__c();
        newArticle.name = (String) article.get('Name');
        newArticle.title__c = (String) article.get('Title__c');
        newArticle.author__c = (String) article.get('Author__c');
        newArticle.description__c = (String) article.get('Description__c');
        newArticle.article_link__c = (String) article.get('Article_Link__c');
        upsert newArticle;
        
        return newArticle;
    }
}
