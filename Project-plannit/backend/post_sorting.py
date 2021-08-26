from datetime import date
from datetime import datetime
from collections import deque

# These are the parameters a post struct should have. The struct itself is a dictionary.
# post_struct = {'creator': 'username', 'title': 'subject', 'posted_date': 'date', 'posted_time': 'time', 'event_date': 'date', 'event_time': 'time', 'in_person': 1, 'location': 'some_location', 'size': 10}


def sort_by_upcoming(list_of_posts):
	"""
	Sorts posts by the ones that are occurring the soonest.

	:param list_of_posts: The list of posts to sort.
	:return: A list of posts sorted by upcoming events.
	"""
	# current_date = date.today()
	# date_string = current_date.strftime("%m/%d/%Y")
	# time = datetime.now().time()
	# time_string = time.strftime("%H:%M")

	# print("Current Date:", date_string)
	# print("Current Time:", time_string)

	sorted_list = sorted(list_of_posts, key=lambda x: datetime.strptime(x['event_datetime'], '%m/%d/%Y %H:%M'), reverse=False)

	return sorted_list


def sort_by_date(list_of_posts, start_date, end_date):
	"""
	Sorts posts by the ones whose events fall between start_date and end_date.

	:param list_of_posts: The list of posts to sort.
	:param start_date: Find posts whose events start after this date.
	:param end_date: Find posts whose events start before this date.
	:return: A list of posts that fall between the specified
	dates, starting with the events that will occur soonest.
	"""
	sorted_list = []
	list_of_posts.sort(reverse=False, key = lambda x:x['event_date'])
	for post in list_of_posts:
		# print('Comparing', post['event_date'], 'with', start_date)
		if post['event_date'] >= start_date and post['event_date'] <= end_date:
			sorted_list.append(post)
	return sorted_list


def sort_by_time(list_of_posts, start_time, end_time):
	"""
	Sorts posts by the ones whose events fall between start_time and end_time. This
	function makes most sense when used with sort_by_date().

	:param list_of_posts: The list of posts to sort.
	:param start_time: Find posts whose events start after this time.
	:param end_time: Find posts whose events start before this time.
	:return: A list of posts that fall between the specified
	times, starting with the events that will occur soonest.
	"""
	sorted_list = []
	list_of_posts.sort(reverse=False, key = lambda x:x['event_time'])
	for post in list_of_posts:
		# print('Comparing', post['event_date'], 'with', start_date)
		if post['event_time'] >= start_time and post['event_time'] <= end_time:
			sorted_list.append(post)
	return sorted_list


def sort_by_minimum_size(list_of_posts, minimum_size):
	"""
	Sorts posts by the ones that have a group size of minimum_size or greater. Organize
	them in increasing order.

	:param list_of_posts: The list of posts to sort.
	:param minimum_size: The minimum possible group size.
	:return: A list of posts that are sorted from the smallest group size to the greatest,
	with the smallest being of minimum_size.
	"""
	sorted_list = []
	list_of_posts.sort(key = lambda x:int(x['size']))
	for post in list_of_posts:
		if int(post['size']) >= minimum_size:
			sorted_list.append(post)
	return sorted_list


def sort_by_maximum_size(list_of_posts, maximum_size):
	"""
	Sorts posts by the ones that have a group size of maximum_size or less. Organize
	them in decreasing order.

	:param list_of_posts: The list of posts to sort.
	:param maximum_size: The maximum possible group size.
	:return: A list of posts that are sorted from the greatest group size to the least,
	with the largest being of maximum_size.
	"""
	sorted_list = []
	list_of_posts.sort(reverse=True, key = lambda x:int(x['size']))
	for post in list_of_posts:
		if int(post['size']) <= maximum_size:
			sorted_list.append(post)
	return sorted_list


def sort_by_size(list_of_posts, minimum_size, maximum_size):
	"""
	Sorts posts by the ones that have a group size between minimum_size and maximum_size (inclusive). Organize
	them in increasing order.

	:param list_of_posts: The list of posts to sort.
	:param minimum_size: The minimum possible group size.
	:param maximum_size: The maximum possible group size.
	:return: A list of posts that are sorted from the smallest group size to the greatest,
	with all the posts having a group size between minimum_size and maximum_size (inclusive).
	"""
	list_of_posts = sort_by_maximum_size(list_of_posts, maximum_size)
	list_of_posts = sort_by_minimum_size(list_of_posts, minimum_size)
	return list_of_posts


def sort_by_location(list_of_posts, zipcode):
	"""
	Sorts posts by the ones that are closest.

	:param list_of_posts: The list of posts to sort.
	:param zipcode: User's input zipcode
	"""
	stack = deque()
	diff = 0
	diffZip = ''
	for post in list_of_posts:
		currZip = int(post['location'])
		zip = abs(currZip - zipcode)
		if diff <= zip:
			diff = zip
			diffZip = post['location']
			stack.append(diffZip)
	return stack
