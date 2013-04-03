<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Spike3.aspx.cs" Inherits="NoteTaLoc.Spike3" %>


<html>
    <head runat="server">

		<title>Spike 3</title>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<!-- Elément Google Maps indiquant que la carte doit être affiché en plein écran et
		qu'elle ne peut pas être redimensionnée par l'utilisateur -->
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
		<!-- Inclusion de l'API Google MAPS -->
		<!-- Le paramètre "sensor" indique si cette application utilise détecteur pour déterminer la position de l'utilisateur -->
		<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
        <script type="text/javascript">

        <%if(Request["lat"] != null) {%>
		    var lat = '<%=Request["lat"].Replace("_", ".")%>';
		    var lon = '<%=Request["lon"].Replace("_", ".")%>';
		<%} else {%>
		    var lat = '0';
		    var lon = '0';
        <%}%>

		function initialiser() {
			var latlng = new google.maps.LatLng(lat, lon);
	
			var options = {
				center: latlng,
				zoom: 13,
				mapTypeId: google.maps.MapTypeId.ROADMAP
			};
	
			var carte = new google.maps.Map(document.getElementById("carte"), options);
	
			/****************Nouveau code****************/

			//crÃ©ation du marqueur
			var marqueur = new google.maps.Marker({
				position: new google.maps.LatLng(lat, lon),
				map: carte
			});
			/********************************************/
		}

        window.onload = initialiser;

         </script>
	</head>

    <%

    %>
	<body>
		    <form id="form1" runat="server">
    <div>
		<div id="carte" style="width:100%; height:80%"></div>
        <div id="Div1" style="width:100%; height:20%">
            
            
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="notetaloc" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="GEO_ID_LOC" HeaderText="GEO_ID_LOC" SortExpression="GEO_ID_LOC" />
                    <asp:BoundField DataField="GEO_LONG" HeaderText="GEO_LONG" SortExpression="GEO_LONG" />
                    <asp:BoundField DataField="GEO_LATT" HeaderText="GEO_LATT" SortExpression="GEO_LATT" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="notetaloc" runat="server" ConnectionString="<%$ ConnectionStrings:notetaloc-spike3ConnectionString %>" SelectCommand="SELECT [GEO_LONG], [GEO_LATT], [GEO_ID_LOC] FROM [NTLGEO_GEOLOCALISATION]"></asp:SqlDataSource>
            
            
        </div>    
    </div>
    </form>
	</body>
</html>
