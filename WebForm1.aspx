<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Sample1_1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        body {
            /* set margin to 0 and overflow to hidden, to go fullscreen */
            margin: 0;
            overflow: hidden;
        }
    </style>
    <script src="JS/three.js"></script>
    <script src="JS/OrbitControls.js"></script>
    <script src="JS/state.js"></script>
     <script src="js/OrbitControls.js" type="text/javascript" charset="utf-8"></script>
    <script src="JS/dat.gui.js"></script>
</head>
<body>
     <div id="WebGL-output">
        <p>hello</p>


    </div>
    <div id="Stats-output">
</div>
     <script type="text/javascript">
          var jingdu = new Array();
                        var weidu = new Array();
                        <%
                        for(int k=0;k<len;k++){
                         %>
                         jingdu.push("<%=jd[k]%>");
                         weidu.push("<%=wd[k]%>");
         <%
                        }
                         %>
         var orbitControls;
           function init() {

     

        // create a scene, that will hold all our elements such as objects, cameras and lights.
        var scene = new THREE.Scene();

        // create a camera, which defines where we're looking at.
        var camera = new THREE.PerspectiveCamera(45, window.innerWidth / window.innerHeight, 0.1, 1000);

        // create a render and set the size
        var renderer = new THREE.WebGLRenderer();

        renderer.setClearColor(new THREE.Color(0xFFFFFF, 1.0));
        renderer.setSize(window.innerWidth, window.innerHeight);
        renderer.shadowMapEnabled = true;

        orbitControls = new THREE.OrbitControls(camera, renderer.domElement);

        // create the ground plane
        var planeGeometry = new THREE.PlaneGeometry(60, 40, 1, 1);
        var planeMaterial = new THREE.MeshLambertMaterial({color: 0xffffff});
        var plane = new THREE.Mesh(planeGeometry, planeMaterial);
       
        // rotate and position the plane
        plane.rotation.x = -0.5 * Math.PI;
        plane.position.x = 0;
        plane.position.y = 0;
        plane.position.z = 0;

        // add the plane to the scene
        scene.add(plane);

        // position and point the camera to the center of the scene
        camera.position.x = -20;
        camera.position.y = 25;
        camera.position.z = 20;
        camera.lookAt(new THREE.Vector3(5, 0, 0));

        // add subtle ambient lighting
        var ambientLight = new THREE.AmbientLight(0x494949);
     scene.add(ambientLight);

        // add spotlight for the shadows
        var spotLight = new THREE.SpotLight(0xffffff);
        spotLight.position.set(-40, 60, 10);
        spotLight.castShadow = true;
        scene.add(spotLight);

        // add the output of the renderer to the html element
        document.getElementById("WebGL-output").appendChild(renderer.domElement);

        // call the render function
        var step = 0;

        var geometryP = new THREE.BoxGeometry(5, 4, 10);
        var materialP = new THREE.MeshBasicMaterial({ color: 0x0000ff, side: THREE.DoubleSide });
        circleP = new THREE.Mesh(geometryP, materialP);
        circleP.name = "第一个物体";
        circleP.position.set(0, 0, 0);
        scene.add(circleP);

               /////////////
        var geometry = new THREE.TorusKnotGeometry(10, 3, 100, 16,1,1);
        var material = new THREE.MeshBasicMaterial({ color: 0x0000ff });
        var torusKnot = new THREE.Mesh(geometry, material);
        scene.add(torusKnot);


        var geometry = new THREE.TorusBufferGeometry(10, 3, 16, 100);
        var material = new THREE.MeshBasicMaterial({ color: 0x00ff00 });
        var torus = new THREE.Mesh(geometry, material);
        scene.add(torus);

               //Create a closed wavey loop
        var curve = new THREE.CatmullRomCurve3([
            new THREE.Vector3(-10, 0, 10),
            new THREE.Vector3(-5, 5, 5),
            new THREE.Vector3(0, 0, 0),
            new THREE.Vector3(5, -5, 5),
            new THREE.Vector3(10, 0, 10)
        ]);

        var geometry = new THREE.Geometry();
        geometry.vertices = curve.getPoints(50);

        var material = new THREE.LineBasicMaterial({ color: 0xff0000 });
        var meshm = new THREE.Mesh(geometry, material);
        scene.add(meshm);
               /////////////


        render();

        function addCube() {

        }

        function render() {
          
            if (orbitControls)
                orbitControls.update();

            // render using requestAnimationFrame
            requestAnimationFrame(render);
            renderer.render(scene, camera);
        }

     
    }
    window.onload = init


</script>
 
</body>
</html>
