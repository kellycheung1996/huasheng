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
        // ��ȡ���������Ϊ��ѯ�ؼ��֣����޹ؼ��֣����ѯȫ�����ݡ�   
        String q="pid:"+param;
        SolrQuery solrQuery = new SolrQuery(q);  
        // ����ʹ���ĸ�request  
        // handler��������������ָ������ʹ��Ĭ�ϵ�handler.Ĭ����/select����solrConfig.xml����/select���searchHandler���򷵻����´���  
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