import sys, os, re

FILE_REGEXP = re.compile(r'\$\$(?P<file>[\w\/\.]+)(\((?P<options>[\w]+)\))?')

def gen_deps(fileName):
	depList = []

	with open(fileName, 'r') as file:
		for line in file.readlines():
			for match in FILE_REGEXP.finditer(line):
				depList.append(match.group('file'))

	return depList

def process(fileName, targetName):
	def process_match(match):
		binFile = os.path.join(os.path.dirname(fileName), match.group('file'))

		if not os.path.exists(binFile):
			sys.exit("{}: `{}` doesn't exist".format(
				fileName, binFile
			))

		wordLen = 1

		options = match.group('options')

		if options:
			if 'w' in options:
				wordLen = 4

			elif 's' in options:
				wordLen = 2

			elif 'b' in options:
				wordLen = 1

		result = ''

		if wordLen == 4:
			result = 'WORD'

		elif wordLen == 2:
			result = 'SHORT'

		else:
			result = 'BYTE'
			wordLen = 1

		with open(binFile, 'rb') as f:
			while True:
				data = f.read(wordLen)

				if data == b'':
					break

				result += ' ${:X}'.format(int.from_bytes(data, 'little'))

		return result

	with open(fileName, 'r') as fin:
		with open(targetName, 'w') as fout:
			for line in fin.readlines():
				fout.write(FILE_REGEXP.sub(process_match, line))

if __name__ == '__main__':
	import argparse

	parse = argparse.ArgumentParser()

	parse.add_argument('file')

	parse.add_argument('-m')
	parse.add_argument('-o')

	args = parse.parse_args()

	fileName   = args.file
	targetFile = args.o

	if not fileName:
		sys.exit(":(")

	if not os.path.exists(fileName):
		sys.exit("`{}` doesn't exist!".format(fileName))

	if not targetFile:
		(baseName, ext) = os.path.splitext(fileName)

		targetFile = '{}{}'.format(
			baseName,
			ext[:(-len("_unprocessed"))] if ext.endswith("_unprocessed") else '{}_processed'.format(ext) # ew
		)

	if args.m:
		makeFile = args.m
		deps = gen_deps(fileName)

		with open(makeFile, 'w') as f:
			f.write('{}: {}\n'.format(
				targetFile,
				' '.join(map(lambda dep: os.path.join(os.path.dirname(fileName), dep), deps))
			))

	else:
		process(fileName, targetFile)
