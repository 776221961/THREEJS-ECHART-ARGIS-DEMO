<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="拉伸曲线.aspx.cs" Inherits="Sample1_1.拉伸曲线" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="JS/dat.gui.js"></script>
    <script src="JS/three.js"></script>
    <script src="JS/state.js"></script>
    <script src="JS/helvetiker_regular.typeface.js"></script>
    <script src="JS/TrackballControls.js"></script>
    
     <style>
        body {
            /* set margin to 0 and overflow to hidden, to go fullscreen */
            margin: 0;
            overflow: hidden;
        }
    </style>
</head>
<body>
   <div id="Stats-output">
</div>
<!-- Div which will hold the Output -->
<div id="WebGL-output">
</div>
    <!-- Javascript code that runs our Three.js examples -->
<script type="text/javascript">
     var x = new Array();
     var y= new Array();
     var z= new Array();
                        <%
                        for(int k=0;k<len;k++){
                         %>
                         x.push("<%=x[k]%>");
    y.push("<%=y[k]%>");
      z.push("<%=z[k]%>");
    <%
                        }
                         %>



    /////////////

       var x2 = new Array();
     var y2= new Array();
     var z2= new Array();
                        <%
                        for(int k2=0;k2<len2;k2++){
                         %>
                         x2.push("<%=x2[k2]%>");
    y2.push("<%=y2[k2]%>");
      z2.push("<%=z2[k2]%>");
         <%
                        }
                         %>
    // once everything is loaded, we run our Three.js stuff.
    var Trackball;
    function init() {

    //  var stats = initStats();
     

        // create a scene, that will hold all our elements such as objects, cameras and lights.
        var scene = new THREE.Scene();

        // create a camera, which defines where we're looking at.
        var camera = new THREE.PerspectiveCamera(45, window.innerWidth / window.innerHeight, 0.1, 10000);

        // create a render and set the size
        var webGLRenderer = new THREE.WebGLRenderer();
        webGLRenderer.setClearColor(new THREE.Color(0xEEEEEE, 1.0));
        webGLRenderer.setSize(window.innerWidth, window.innerHeight);
        webGLRenderer.shadowMapEnabled = true;

        // position and point the camera to the center of the scene
        camera.position.x = -30;
        camera.position.y = 40;
        camera.position.z = 50;
        camera.lookAt(new THREE.Vector3(10, 0, 0));

        // add the output of the renderer to the html element
        document.getElementById("WebGL-output").appendChild(webGLRenderer.domElement);
        Trackball = new THREE.TrackballControls(camera, webGLRenderer.domElement);
        //var axes = new THREE.AxisHelper(500);
        //scene.add(axes);
         
        var material = new THREE.LineBasicMaterial({
            color: 0x0000ff
        });

        var geometry = new THREE.Geometry();
        geometry.vertices.push(
            new THREE.Vector3(0, -500, 0),
            new THREE.Vector3(0, 0, 0),
            new THREE.Vector3(0, 500, 0)
        );

        var line = new THREE.Line(geometry, material);
        scene.add(line);

        var size = 500;
        var step = 100;

        var gridHelper = new THREE.GridHelper(size, step, 0x444444, 0x888888);
        scene.add(gridHelper);
         
        var gridHelper2 = new THREE.GridHelper(size, step, 0x444444, 0x888888);
        gridHelper2.position.set(0, 500, 0);
        
        scene.add(gridHelper2);

        var gridHelper3 = new THREE.GridHelper(size, step, 0x444444, 0x888888);
        gridHelper3.position.set(0, -500, 0);
        scene.add(gridHelper3);

      
        
        //var sphere = new THREE.SphereGeometry(1000,1000,1000);
        //var object = new THREE.Mesh(sphere, new THREE.MeshBasicMaterial(0xff0000));
        //var box = new THREE.BoxHelper(object);
        //scene.add(box);

        function initObject() {
            var px = [-500,-400,-300,-200,-100,0,100,200,300,400,500];
            var py = [-500, -400, -300, -200, -100, 0, 100, 200, 300, 400, 500];
            var pz = [-500, -400, -300, -200, -100, 0, 100, 200, 300, 400, 500];
            for (var i = 0; i < 10; i++) {
                var xtext = 'x:' + px[i].toString();
                var text = new THREE.TextGeometry(xtext, {
                    size: 10,
                    height: 1,
                    weight: 'normal',
                    font: 'helvetiker',
                    style: 'normal',
                    bevelThickness: 1,
                    bevelSize: 1,
                    bevelSegments: 1,
                    curveSegments: 50,
                    steps: 1
                });
                var meshMaterial = new THREE.MeshNormalMaterial({
                    flatShading: THREE.FlatShading,
                    transparent: true,
                    opacity: 0.9
                });
                var mesh = new THREE.Mesh(text, meshMaterial);

                mesh.position.x = (i * 100) - 500;
                mesh.position.y = 0;
                mesh.position.z = 0;
                scene.add(mesh);
            }
            for (var i = 0; i < 10; i++) {
                var xtext = 'Y:' + py[i].toString();
                var text = new THREE.TextGeometry(xtext, {
                    size: 10,
                    height: 1,
                    weight: 'normal',
                    font: 'helvetiker',
                    style: 'normal',
                    bevelThickness: 1,
                    bevelSize: 1,
                    bevelSegments: 1,
                    curveSegments: 50,
                    steps: 1
                });
                var meshMaterial = new THREE.MeshNormalMaterial({
                    flatShading: THREE.FlatShading,
                    transparent: true,
                    opacity: 0.9
                });
                var mesh = new THREE.Mesh(text, meshMaterial);

                mesh.position.y = (i * 100) - 500;
                mesh.position.z= 0;
                mesh.position.x = 0;
                scene.add(mesh);
            }
            for (var i = 0; i < 10; i++) {
                var xtext = 'z:' + pz[i].toString();
                var text = new THREE.TextGeometry(xtext, {
                    size: 10,
                    height: 1,
                    weight: 'normal',
                    font: 'helvetiker',
                    style: 'normal',
                    bevelThickness: 1,
                    bevelSize: 1,
                    bevelSegments: 1,
                    curveSegments: 50,
                    steps: 1
                });
                var meshMaterial = new THREE.MeshNormalMaterial({
                    flatShading: THREE.FlatShading,
                    transparent: true,
                    opacity: 0.9
                });
                var mesh = new THREE.Mesh(text, meshMaterial);

                mesh.position.z = (i * 100) - 500;
                mesh.position.y = 0;
                mesh.position.x = 0;
                scene.add(mesh);
            }
            //var geometry = new THREE.Geometry();
            //geometry.vertices.push(new THREE.Vector3(-500, 0, 0));//在x轴上定义两个点p1(-500,0,0)
            //geometry.vertices.push(new THREE.Vector3(500, 0, 0));//p2(500,0,0)

            //for (var i = 0; i <= 20; i++) {//这两个点决定了x轴上的一条线段，将这条线段复制20次，分别平行移动到z轴的不同位置，就能够形成一组平行的线段。

            //    var line = new THREE.Line(geometry, new THREE.LineBasicMaterial({ color: 0x3f0000, opacity: 0.2 }));
            //    line.position.z = (i * 50) - 500;
            //    scene.add(line);

            //    var line = new THREE.Line(geometry, new THREE.LineBasicMaterial({ color: 0x003f00, opacity: 0.2 }));
            //    line.position.x = (i * 50) - 500;
            //    line.rotation.y = 90 * Math.PI / 180; //  旋转90度
            //    scene.add(line);
            //    //将p1p2这条线先围绕y轴旋转90度，然后再复制20份，平行于z轴移动到不同的位置，也能形成一组平行线。
            //}

            //var geometry2 = new THREE.Geometry();
            //geometry2.vertices.push(new THREE.Vector3(0, 0, -500));//在x轴上定义两个点p1(-500,0,0)
            //geometry2.vertices.push(new THREE.Vector3(0, 0, 500));//p2(500,0,0)

            //for (var i = 0; i <= 20; i++) {//这两个点决定了x轴上的一条线段，将这条线段复制20次，分别平行移动到z轴的不同位置，就能够形成一组平行的线段。

            //    var line2 = new THREE.Line(geometry2, new THREE.LineBasicMaterial({ color: 0x0000ff, opacity: 0.2 }));
            //    line2.position.y = (i * 50) - 500;
            //    scene.add(line2);

              
            //    //将p1p2这条线先围绕y轴旋转90度，然后再复制20份，平行于z轴移动到不同的位置，也能形成一组平行线。
            //}
        }
        initObject();
        // call the render function
        var step = 0;

        // the points group
        var spGroup;
        // the mesh
        var tubeMesh;

        var spGroup2;
        // the mesh
        var tubeMesh2;
        // setup the control gui
        var controls = new function () {

            this.numberOfPoints = 5;
            this.segments = 64;
            this.radius = 10;
            this.radiusSegments = 40;
            this.closed = false;
            this.points = [];
            // we need the first child, since it's a multimaterial

            this.newPoints = function () {
                var points = [];
                //for (var i = 0; i < controls.numberOfPoints; i++) {
                //    var randomX = -20 + Math.round(Math.random() * 50);
                //    var randomY = -15 + Math.round(Math.random() * 40);
                //    var randomZ = -20 + Math.round(Math.random() * 40);

                //    points.push(new THREE.Vector3(randomX, randomY, randomZ));
                //}
                for (var i = 0; i < x.length; i++) {
                    points.push(new THREE.Vector3(x[i]*5,y[i]*5,z[i]*5));
                }
                controls.points = points;
                controls.redraw();
            };

            this.redraw = function () {
                scene.remove(spGroup);
                scene.remove(tubeMesh);
                generatePoints(controls.points, controls.segments, controls.radius, controls.radiusSegments, controls.closed);
            };

        };
        ///////
        var controls2 = new function () {

            this.numberOfPoints = 5;
            this.segments = 64;
            this.radius = 10;
            this.radiusSegments = 40;
            this.closed = false;
            this.points = [];
            // we need the first child, since it's a multimaterial

            this.newPoints = function () {
                var points = [];
               
                for (var i = 0; i < x2.length; i++) {
                    points.push(new THREE.Vector3(x2[i] * 5, y2[i] * 5, z2[i] * 5));
                }
                controls2.points = points;
                controls2.redraw();
            };

            this.redraw = function () {
                scene.remove(spGroup2);
                scene.remove(tubeMesh2);
                generatePoints2(controls2.points, controls2.segments, controls2.radius, controls2.radiusSegments, controls2.closed);
            };

        };
        ////////////
        var gui = new dat.GUI();
        gui.add(controls, 'newPoints');
        gui.add(controls, 'numberOfPoints', 2, 15).step(1).onChange(controls.newPoints);
        gui.add(controls, 'segments', 0, 200).step(1).onChange(controls.redraw);
        gui.add(controls, 'radius', 0, 10).onChange(controls.redraw);
        gui.add(controls, 'radiusSegments', 0, 100).step(1).onChange(controls.redraw);
        gui.add(controls, 'closed').onChange(controls.redraw);


        controls.newPoints();

        //gui.add(controls2, 'newPoints');
        //gui.add(controls2, 'numberOfPoints', 2, 15).step(1).onChange(controls2.newPoints);
        //gui.add(controls2, 'segments', 0, 200).step(1).onChange(controls2.redraw);
        //gui.add(controls2, 'radius', 0, 10).onChange(controls2.redraw);
        //gui.add(controls2, 'radiusSegments', 0, 100).step(1).onChange(controls2.redraw);
        //gui.add(controls2, 'closed').onChange(controls2.redraw);

        controls2.newPoints();

        render();

        function generatePoints(points, segments, radius, radiusSegments, closed) {
            // add n random spheres


            spGroup = new THREE.Object3D();
            var material = new THREE.MeshBasicMaterial({color: 0xff0000, transparent: false});
            points.forEach(function (point) {

                var spGeom = new THREE.SphereGeometry(0.2);
                var spMesh = new THREE.Mesh(spGeom, material);
                spMesh.position.copy(point);
                spGroup.add(spMesh);
            });
            // add the points as a group to the scene
            scene.add(spGroup);

            // use the same points to create a convexgeometry
            var tubeGeometry = new THREE.TubeGeometry(new THREE.SplineCurve3(points), segments, radius, radiusSegments, closed);
            tubeMesh = createMesh(tubeGeometry);
            scene.add(tubeMesh);
        }
        function generatePoints2(points, segments, radius, radiusSegments, closed) {
            // add n random spheres


            spGroup2 = new THREE.Object3D();
            var material = new THREE.MeshBasicMaterial({ color: 0x00ff00, transparent: false });
            points.forEach(function (point) {

                var spGeom = new THREE.SphereGeometry(0.2);
                var spMesh = new THREE.Mesh(spGeom, material);
                spMesh.position.copy(point);
                spGroup2.add(spMesh);
            });
            // add the points as a group to the scene
            scene.add(spGroup2);

            // use the same points to create a convexgeometry
            var tubeGeometry = new THREE.TubeGeometry(new THREE.SplineCurve3(points), segments, radius, radiusSegments, closed);
            tubeMesh2 = createMesh2(tubeGeometry);
            scene.add(tubeMesh2);
        }
        function createMesh(geom) {

            // assign two materials
            //var meshMaterial = new THREE.MeshNormalMaterial();
            var meshMaterial = new THREE.MeshBasicMaterial({color: 0xff0000, transparent: true, opacity: 0.2});

            var wireFrameMat = new THREE.MeshBasicMaterial();
            wireFrameMat.wireframe = true;

            // create a multimaterial
            var mesh = THREE.SceneUtils.createMultiMaterialObject(geom, [meshMaterial, wireFrameMat]);

            return mesh;
        }
        function createMesh2(geom) {

            // assign two materials
            //var meshMaterial = new THREE.MeshNormalMaterial();
            var meshMaterial = new THREE.MeshBasicMaterial({ color: 0x00ff00, transparent: true, opacity: 0.2 });

            var wireFrameMat = new THREE.MeshBasicMaterial();
            wireFrameMat.wireframe = true;

            // create a multimaterial
            var mesh = THREE.SceneUtils.createMultiMaterialObject(geom, [meshMaterial, wireFrameMat]);

            return mesh;
        }
        function render() {
         //  stats.update();

         //   spGroup.rotation.y = step;
         //   tubeMesh.rotation.y = step += 0.01;
            Trackball.update();
            // render using requestAnimationFrame
            requestAnimationFrame(render);
            webGLRenderer.render(scene, camera);
        }

        function initStats() {

            var stats = new Stats();
            stats.setMode(0); // 0: fps, 1: ms

            // Align top-left
            stats.domElement.style.position = 'absolute';
            stats.domElement.style.left = '0px';
            stats.domElement.style.top = '0px';

            document.getElementById("Stats-output").appendChild(stats.domElement);

            return stats;
        }
    }
    window.onload = init;
</script>
</body>
</html>
