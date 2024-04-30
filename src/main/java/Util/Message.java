package Util;

public class Message
{
	private String Content;
	private String type;
	private String cssClass;
	
	public Message(String Content, String type, String cssClass)
	{
		this.Content=Content;
		this.type=type;
		this.cssClass=cssClass;	
		
	}
	// getters and setters


	public String getContent() {
		return Content;
	}

	public void setContent(String Content) {
		this.Content = Content;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCssClass() {
		return cssClass;
	}

	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}
	
	
}
