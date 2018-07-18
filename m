Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=F8+6nAhJriix6pflnBoSVhxAwX5N37DDPq6VcEJTnxs=;
 b=W5ItzvFQuOvCLSIAbMI3rVV20q6lHPwYhOkaDAjZbIjpRbs9P18CkmyKvtRMp3z6sV
 DqdHc1VsSdHwnEWHwgjMP2IMJrgV88ZqUkSv66bIhvT1XrGhkhA+FwoIlqp5JDF8O5/e
 TrYLSRwPlhv21R6h7hk3ir/tnhe3y0aI7i3Xy7cwZV7wc9bNUKqRRxGcMLcceea/ix2A
 1hHwbPDKfDCkMyz14tyu4HL4kw1CrhBcLMS8HQdFE0FARKKvXAh6yrJfuWJHZLEzXcmW
 xV7gyAyy2Ig18I1FySfV4nmuS6b6ebONAIRPNEpX9pifA7JPCLsisyBM7v4Rjb0E1H85
 hZTw==
Subject: Re: Section 4.2: wrong error reporting for pthread functions
References: 
 <CAJbg=FVjq_rwhvSw3Y=7xOxUqN_kV4P=wD42HU9=1u3KGnyJpg@mail.gmail.com>
 <20180714233313.GH12945@linux.vnet.ibm.com>
 <4131cfaa-45c2-e0e0-ecc0-dfa3058c53c3@gmail.com>
 <20180716163924.GZ12945@linux.vnet.ibm.com>
 <2def0b9d-d197-d1dd-2489-72b9c9d2be26@gmail.com>
 <20180717161531.GM12945@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <53b135c3-d9ac-915b-49ee-332efe4e60e5@gmail.com>
Date: Wed, 18 Jul 2018 21:15:12 +0900
MIME-Version: 1.0
In-Reply-To: <20180717161531.GM12945@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Elad Lahav <e2lahav@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/07/17 09:15:31 -0700, Paul E. McKenney wrote:
> On Wed, Jul 18, 2018 at 12:43:16AM +0900, Akira Yokosawa wrote:
>> On 2018/07/16 09:39:24 -0700, Paul E. McKenney wrote:
>>> On Tue, Jul 17, 2018 at 12:42:57AM +0900, Akira Yokosawa wrote:
>>>> Hi Paul,
>>>>
>>>> See inline comments below for a few nits and suggestions.
>>>
>>> I fixed the perror() calls straightforwardly, thank you!
>>> Queued and pushed with both your and Elad's Reported-by.
>>>
>>>> On 2018/07/14 16:33:13 -0700, Paul E. McKenney wrote:
>>>>> On Sat, Jul 14, 2018 at 08:59:48AM -0400, Elad Lahav wrote:
>>>
>>> [ . . . ]
>>>
>>>> I see you have already updated most of the code samples under CodeSamples/,
>>>> but let me suggest an alternative way not to increase line counts
>>>> (or even to decrease line counts).
>>>>
>>>> "pthread_create(3)" man page gives you an example code.
>>>>
>>>> First, two helpers are defined as follows:
>>>>
>>>>        #define handle_error_en(en, msg) \
>>>>                do { errno = en; perror(msg); exit(EXIT_FAILURE); } while (0)
>>>>
>>>>        #define handle_error(msg) \
>>>>                do { perror(msg); exit(EXIT_FAILURE); } while (0)
>>>>
>>>> Then, one of the call sites looks as follows:
>>>>
>>>>                s = pthread_create(&tinfo[tnum].thread_id, &attr,
>>>>                                   &thread_start, &tinfo[tnum]);
>>>>                if (s != 0)
>>>>                    handle_error_en(s, "pthread_create");
>>>>
>>>> If we employ this pattern, one of the hunks in your patch will look like:
>>>>
>>>> -	if (pthread_mutex_lock(pmlp) != 0) {
>>>> -		perror("lock_reader:pthread_mutex_lock");
>>>> -		exit(-1);
>>>> -	}
>>>> +	if ((en = pthread_mutex_lock(pmlp)) != 0)
>>>> +		handle_error_en(en, "lock_reader:pthread_mutex_lock");
>>>>
>>>> Thoughts?
>>>>
>>>> I think these error cases are not our main topic, and to hide the
>>>> details inside helpers sounds reasonable.
>>>
>>> Does it make sense to pull the "if" into the handle_error_en() macro
>>> as well, perhaps like this?
>>>
>>> #define handle_error_en(en, msg) \
>>> 	do { if (!en) break; errno = en; perror(msg); exit(EXIT_FAILURE); } while (0)
>>>
>>> 	s = pthread_create(&tinfo[tnum].thread_id, &attr,
>>> 			   &thread_start, &tinfo[tnum]);
>>> 	handle_error_en(s, "pthread_create");
>>>
>>
>> This version of handle_error_en() can return.
>> As per Elad's suggestion, if we want to make fatal_en() not to return,
>> we can't pull the "if".
>>
>> It looks to me by keeping the "if" out of helper funcs, fatal-error
>> conditions can be made more obvious.
>>
>> 	s = pthread_create(&tinfo[tnum].thread_id, &attr,
>> 			   &thread_start, &tinfo[tnum]);
>> 	if (s != 0)
>> 		fatal_en(s, "pthread_create");
>>
>> I prefer this approach.
> 
> At this point, I believe that the right approach is for me to instead
> make use of the existing api.h wrappers for the pthread_*() functions.
> Smaller code and fewer places to change as opinions shift.  I was
> thinking in terms of instead moving to the pthread_*() functions, but
> this discussion has clearly shown the folly of that approach.  ;-)
> 
> The exceptions are of course the exposition of the pthread_*()
> functions in the toolsoftrade chapter.

Sounds reasonable to me.

> 
>>>> Also, wouldn't it be a good idea to employ auto-numbering scheme as
>>>> mentioned in Section D.3.1.1 of Style Guide when updating code snippets?
>>>> This update will involve a lot of renumbering of line numbers otherwise.
>>>>
>>>> If you feel OK with this approach, I can prepare a patch series
>>>> on behalf of you. (Can take a little while, though.)
>>>
>>> This approach involves labeling lines that are referred to in the text?
>>> If those labels could be introduced as comments in the original code,
>>> that could be really nice!
>>
>> By using "fancyvrb" package instead of "verbatimbox", this is mostly
>> possible.  by "mostly possible", I mean label within comments can
>> be made invisible in the output, but "/*", "*/", and "//" will remain
>> in the output.
>>
>> For example, original source code of Listing 4.1 (using fatal() helper)
>> would look like:
>>
>> 	pid = fork(); //%label[ln:toolsoftrade:fork:fork]
>> 	if (pid == 0) { //%label[ln:toolsoftrade:fork:if]
>> 		/* child */ //%label[ln:toolsoftrade:fork:child]
>> 	} else if (pid < 0) { //%label[ln:toolsoftrade:fork:else]
>> 		/* parent, upon error */ //%label[ln:toolsoftrade:fork:errora]
>> 		fatal("fork"); //%label[ln:toolsoftrade:fork:errorb]
>> 	} else {
>> 		/* parent, pid == child ID */ //%label[ln:toolsoftrade:fork:parent]
>> 	}
>>
>> Corresponding source of the code snippet (after removal of "//") would
>> look like:
>>
>>   pid = fork();%label[ln:toolsoftrade:fork:fork]
>>   if (pid == 0) {%label[ln:toolsoftrade:fork:if]
>>     /* child */%label[ln:toolsoftrade:fork:child]
>>   } else if (pid < 0) {%label[ln:toolsoftrade:fork:else]
>>     /* parent, upon error */%label[ln:toolsoftrade:fork:errora]
>>     fatal("fork");%label[ln:toolsoftrade:fork:errorb]
>>   } else {
>>     /* parent, pid == child ID */%label[ln:toolsoftrade:fork:parent]
>>   }
>>
>> Note that in this example, "%" represents "\" after escaping to LaTeX,
>> "[" for "{", "]" for "}". These 3 escaping characters need to be
>> chosen for each snippet so that they do not appear in the unescaped code.
>> "[" and "]" can not be used for snippets that used array reference,
>> for example.
>>
>> So in theory, we can do what you want, but need somewhat ad-hoc
>> manual tweaks. Still, it might be possible to write a script or two
>> to do such tweaks in a semi-automated way.
> 
> I already use scripts to do the auto-numbering and auto-intenting
> for the old-style listings, so why not?  ;-)
> 
> If I haven't already made these available, please let me know and
> I can send them on.  They aren't exactly profound.

So, there are 3 symbolic links under utilities/ in the Git repo:

    c2latex.sh -> /home/paulmck/bin/c2latex.sh
    extractClatex.sh -> /home/paulmck/bin/extractClatex.sh
    latex2c.sh -> /home/paulmck/bin/latex2c.sh

Now I know why I have no idea how you manage code snippets. ;-)

> 
>> If you'd like to see what the code snippet and reference to labels
>> would be,  I can prepare a experimental branch which is relative to
>> commit f2b9d37d3b95 ("count: Expand on gap between C11 atomics and
>> the Linux kernel").
>>
>> Thoughts?
> 
> Sounds worth a try, thank you!

OK.
I'll send a pseudo pull request when it is ready.
Hopefully in a couple of days.

      Thanks, Akira

> 
> 							Thanx, Paul
> 

