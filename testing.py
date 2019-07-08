# Testing

import ast

def compare_mats(mat1, mat2):
	for i in range(min(len(mat1), len(mat2))):
		for j in range(min(len(mat1[0]), len(mat2[0]))):
			if abs(mat1[i][j] - mat2[i][j]) > 0.001:
				print("Mismatch index: ", i, j)
				print(mat1[i][j-2:j+3])
				print(mat2[i][j-2:j+3])
				break

def vec_float(vec):
	new_vec = []
	for elem in vec:
		new_vec.append(float(elem))
	return new_vec

def compare():
	with open("test_output.txt", "w") as out:
		with open("test.txt") as f:
			with open("test_swift.txt") as g:
				f_lines = f.readlines()
				g_lines = g.readlines()
				f_mat = [f_lines[1], f_lines[3]]
				g_mat = [g_lines[1], g_lines[3]]
				f_mat = [x.strip() for x in f_mat]
				g_mat = [x.strip() for x in g_mat]
				f_mat = [ast.literal_eval(x) for x in f_mat]
				g_mat = [ast.literal_eval(x) for x in g_mat]
				f_mat = [vec_float(x) for x in f_mat]
				g_mat = [vec_float(x) for x in g_mat]
				compare_mats(f_mat, g_mat)

def parse_swift():
	with open("test_swift.txt", "r") as g:
		#data = g.read().replace('[', '\'').replace(']', '\'').replace('nan', '-666,').replace('0.00.', '0.0 0.')
		with open("test_swift.txt", "w") as h:
			h.write(data)

def parse_matlab():
	with open("test.txt", "r") as f:
		# data = f.read().replace(' ', '\' \'').replace(' ', ',')
		with open("test.txt", "w") as h:
			h.write(data)

def print_error():
	with open("test.txt") as f:
		with open("test_swift.txt") as g:
			matlab = f.read()
			swift = g.read()
			# print(len(matlab))
			print("matlab:")
			print(matlab[0:6000])
			print("swift:")
			print(swift[4000:6000])

compare()
# parse_swift()
# parse_matlab()
# print_error()



# results = {'val_loss': [2.4708025455474854, 2.55861234664917, 2.3226659297943115, 2.2228264808654785, 2.3297672271728516, 2.160214900970459, 1.8430386781692505, 1.7532891035079956, 1.255086898803711, 4.103357315063477, 1.207775592803955, 2.4828226566314697, 2.8203554153442383, 2.859748125076294, 2.8030343055725098, 2.7143914699554443], 'loss': [2.6528525352478027, 2.486415386199951, 2.5905818939208984, 2.331080198287964, 2.1966164112091064, 2.282771587371826, 2.1083545684814453, 1.806266188621521, 1.775718331336975, 1.241202473640442, 5.116397857666016, 1.4884318113327026, 2.949941635131836, 3.1390798091888428, 3.080071210861206, 2.958752393722534]}
# import matplotlib.pyplot as plt
# plt.plot(results['val_loss'], 'r+', label="validation loss")
# plt.plot(results['loss'], 'bo', label="test loss")
# plt.legend(bbox_to_anchor=(0.05, 0.90), loc=2, borderaxespad=0.)
# plt.title("Oracle loss")
# plt.ylabel("Loss")
# plt.xlabel("Epoch")
# plt.show()
