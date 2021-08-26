import post_sorting as ps

# These are the parameters a post struct should have. The struct itself is a dictionary.
# post_struct = {'creator': username, 'title': subject, 'posted_date': date, 'posted_time': time, 'posted_datetime': datetime, 'event_date': date, 'event_time': time, 'event_datetime': datetime, 'in_person': 1, 'location': location, 'size': 10}


# Contains a list of post-structs. Is organized depending on how user wants it sorted.
list_of_posts = []


# Populates list_of_posts with posts from example_post_structs.txt
def parse_file(filename):
	f = open(filename, 'r')
	posts_list = f.readlines()
	f.close()
	for post in posts_list:
		details = post.split(',')
		post_struct = {'creator': details[0], 'title': details[1], 'posted_date': details[2], 'posted_time': details[3], 'posted_datetime': (details[2]+' '+details[3]), 'event_date': details[4], 'event_time': details[5], 'event_datetime': (details[4]+' '+details[5]), 'in_person': details[6], 'location': details[7], 'size': details[8][:-1]}
		list_of_posts.append(post_struct)


def test_sort_by_upcoming():
	result = ps.sort_by_upcoming(list_of_posts)
	for post in result:
		print(post,'\n')
	return result


def test_sort_by_date():
	result = ps.sort_by_date(list_of_posts, '03/17/2021', '04/01/2021')
	for post in result:
		print(post,'\n')
	return result


def test_sort_by_time():
	result = ps.sort_by_time(list_of_posts, '10:00', '14:00')
	for post in result:
		print(post,'\n')
	return result


def test_sort_by_minimum_size():
	result = ps.sort_by_minimum_size(list_of_posts, 5)
	for post in result:
		print(post,'\n')
	return result


def test_sort_by_maximum_size():
	result = ps.sort_by_maximum_size(list_of_posts, 10)
	for post in result:
		print(post,'\n')
	return result


def test_sort_by_size():
	result = ps.sort_by_size(list_of_posts, 5, 100)
	for post in result:
		print(post,'\n')
	return result


def test_sort_by_location():
	result = ps.sort_by_location(list_of_posts, 14213)
	print(result, '\n')
	return result


if __name__ == '__main__':
	print("Running Tests\n\n\n")

	parse_file('sorting_temp_folder/example_post_structs.txt') 

	print("Sorting posts by upcoming\n")
	test_sort_by_upcoming()
	print("\n")

	print("Sorting posts by date\n")
	test_sort_by_date()
	print("\n")

	print("Sorting posts by time\n")
	test_sort_by_time()
	print("\n")

	print("Sorting posts by minimum size\n")
	test_sort_by_minimum_size()
	print("\n")

	print("Sorting posts by maximum size\n")
	test_sort_by_maximum_size()
	print("\n")

	print("Sorting posts by size\n")
	test_sort_by_size()
	print("\n")

	# test_sort_by_location()
