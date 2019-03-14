note
	description: "Summary description for {EWF_DEBUG_EXECUTION}."
	author: ""
	date: "$Date: 2015-06-10 09:48:30 -0700 (Wed, 10 Jun 2015) $"
	revision: "$Revision: 97452 $"

class
	EWF_DEBUG_EXECUTION

inherit
	WSF_EXECUTION

create
	make

feature -- Execution

	execute
		local
			page: WSF_HTML_PAGE_RESPONSE
			body: STRING_32
			i: INTEGER
			input: INTEGER_32
		do
			create body.make(2048)
			create page.make
  			body.append("<h1>Hello there!</h1></br>");
			page.set_title ("EWF FizzBuzz!")
			body.append ("<form action='debug.cgi' method='POST'><p>Hello, what is the highest number?</p><input type='text' name='limit'/><input type='submit' value='Validate'/></form>" + "<br>")
			if attached request.string_item ("limit") as a_limit then
				--| If yes, say hello world #name

				if not a_limit.is_empty then
					input := a_limit.to_integer_32
					if input <= 0 then
						body.append ("limit should be greater than zero")
					else
						from
							i := 1
						until
							i > input
						loop
						if (i \\ 3) = 0 and (i \\ 5) = 0 then
							body.append ("FizzBuzz" + "<br>")
						elseif (i \\ 3) = 0 then
							body.append ("Fizz" + "<br>")
						elseif (i \\ 5) = 0 then
							body.append ("Buzz" + "<br>")
						else
							body.append (i.out + "<br>")
						end
						i := i + 1
						end
					end
				else
				body.append ("limit should be greater than zero")
				end
			end
		page.header.put_content_type_text_html
		page.set_body (body)
		response.send (page)
	end
end
