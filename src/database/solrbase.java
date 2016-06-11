package database;


import org.apache.solr.client.solrj.SolrQuery;  
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrServer;  
import org.apache.solr.client.solrj.response.QueryResponse;  
import org.apache.solr.common.SolrDocument;  
import org.apache.solr.common.SolrDocumentList;  

  
public class solrbase {  
	private static String serverUrl = "http://localhost:8983/solr/core1"; 
    SolrServer server=null;
	public  void getQuery(String param) throws SolrServerException {  
        SolrServer solrServer = new HttpSolrServer(serverUrl);  
        // 读取输入参数作为查询关键字，若无关键字，则查询全部内容。   
        String q="pid:"+param;
        SolrQuery solrQuery = new SolrQuery(q);  
        // 定义使用哪个request  
        // handler进行搜索，若无指定，则使用默认的handler.默认是/select。若solrConfig.xml中无/select这个searchHandler，则返回以下错误  
        solrQuery.set("qt", "/search");  
        // solrQuery.setRows(5);  
        QueryResponse resp = solrServer.query(solrQuery);  
  
        SolrDocumentList hits = resp.getResults();  
  
        for (SolrDocument doc : hits) {  
            for (String fieldName : doc.getFieldNames()) {  
                System.out.println(fieldName + " : " + doc.getFieldValue(fieldName) + "  ");  
            }  
            System.out.println("------------------------Next Document--------------------------------");  
        }  
  
    }  
}  