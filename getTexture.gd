extends Particles2D

var particleMaterial = ParticlesMaterial.new()

func _ready() -> void:
	
	initialSetup()
	
	# simple
	setAngularVelocity()
	setInitialVelocity()
	setGraviy()
	setAngle()
	setDirection()
	
	# complicated
	setScale()
	setColorRamp()
	
	emit()
	curveToConsoleLog()


func initialSetup():
	self.texture = load("res://white_square.png")
	self.set_process_material(particleMaterial)
	self.amount = 100


func emit():
	self.emitting = true
	pass



func setDirection():
	particleMaterial.direction = Vector3(0.0,-1.0,0.0)
	particleMaterial.spread = 7.76

func setGraviy():
	particleMaterial.gravity = Vector3(0.0,0.0,0.0)

func setInitialVelocity():
	particleMaterial.initial_velocity = 427.58

func setAngularVelocity():
	particleMaterial.angular_velocity = 720.0
	particleMaterial.angular_velocity_random = 1.0

func setAngle():
	particleMaterial.angle = 360.0
	particleMaterial.angle_random = 1.0



func setScale():
	particleMaterial.scale = 0.3
	particleMaterial.scale_curve = getCurveTexture()

func getCurveTexture() -> CurveTexture:
	var curveTeture = CurveTexture.new()
	curveTeture.curve = getCurve()
	return curveTeture

func getCurve() -> Curve:
	var curve = Curve.new()
	curve.add_point(Vector2(0.0,0.0))
	curve.add_point(Vector2(0.103774, 0.890484))
	curve.add_point(Vector2(1.0,0.0))
	return curve



func setColorRamp():
	particleMaterial.color_ramp = getGradientTexture()

func getGradientTexture() -> GradientTexture:
	var gradientTexture = GradientTexture.new()
	gradientTexture.gradient = getGradient()
	return gradientTexture

func getGradient() -> Gradient:
	var gradient = Gradient.new()
	gradient.add_point(0.0, Color(1,0.539062,0,1)) # if you don't start at 0.0, black will be the color at this position
	gradient.add_point(0.248148, Color(1,0.539062,0,1))
	gradient.add_point(0.377778, Color(1,0.454102,0,1))
	gradient.add_point(0.655556, Color(1,0.1875,0,1))
	gradient.add_point(1.0, Color(1,1,1,1))
	
	return gradient










func curveToConsoleLog():
	print('Particles2D curve values START')
	print('Particle2D: ', self) # [Particles2D:1191]
	print('Process Material: ', self.process_material) # [ParticlesMaterial:1192]
	print('Scale Curve: ', self.process_material.scale_curve) # [CurveTexture:1197]
	print('Curve: ', self.process_material.scale_curve.curve) # [Curve:1196]
	print('Curve Point Counts: ', self.process_material.scale_curve.curve.get_point_count()) #3
	print('Particles2D curve values END')
