Return-Path: <SRS0=VxP2=5A=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TXjOWB/iOrKG+wZt1qEhbk6Ng7/eAAVfHQulbfMeiOg=;
        b=gT02ZJ4u3fRcQrQFDIm+mv2JUHtTt5AZVu/D46v7WvuS3i5KmMqONwohX9AKu7R69A
         L+E81RfoqjU13JIRd+nuMueVWeYhpOy+xYtI9yt3bLQOU9Xfkgo5tjlrfT6xQ0Ssmqrn
         dyxr6/gO5mdlmedQ2FHSW3ftO7U+IRI+1rtPvDo641IlR9jr1LeAGGggtg81g+uwlPUR
         U6eNiMLFhqxfrtjdXidrJ7zy0WXIPtso29VJHRAJQwVqQQxS+CT7glwBfUUtpdFhvvf0
         oA94pNRxU/9CyDBN+/3N503wWIa6pja77jzurYDuMtJTzwGnYZAR6yBlHz5TP8WXz4kI
         Gm+Q==
Subject: Re: [RFC NOT PULL] Experiment to add background to question part of
 QQZ
References: <1bca91e5-b192-85db-2035-6e524ee1cb57@gmail.com>
 <20200315032641.GR3199@paulmck-ThinkPad-P72>
 <b3918d50-838e-68a8-5a39-158ab1442ef5@gmail.com>
 <20200315152039.GS3199@paulmck-ThinkPad-P72>
 <20200315184318.GA20874@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <91531796-28ec-0a43-d270-4a481627dbeb@gmail.com>
Date: Mon, 16 Mar 2020 07:23:11 +0900
MIME-Version: 1.0
In-Reply-To: <20200315184318.GA20874@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sun, 15 Mar 2020 11:43:18 -0700, Paul E. McKenney wrote:
> On Sun, Mar 15, 2020 at 08:20:39AM -0700, Paul E. McKenney wrote:
>> On Sun, Mar 15, 2020 at 01:33:36PM +0900, Akira Yokosawa wrote:
>>> On Sat, 14 Mar 2020 20:26:41 -0700, Paul E. McKenney wrote:
>>>> On Sun, Mar 15, 2020 at 09:40:37AM +0900, Akira Yokosawa wrote:
>>>>> Hi Paul,
>>>>>
>>>>> I have been experimenting to make question part of QQZ stand out.
>>>>> At the moment, official targets are not affected by the change.
>>>>> You can see the new look by building targets "msnt" and "1csf".
>>>>>
>>>>> Another added target "noqq" is an experiment to remove inline questions.
>>>>> Anchors to the QQAs in Appendix E are presented at the right side of
>>>>> the column.
>>>>>
>>>>> To make noqq to work, I need to change the \QuickQuiz{} macro format
>>>>> so that the question part is enclosed in "{ ... }".
>>>>>
>>>>> Please give them a try and share your thoughts.
>>>>
>>>> Interesting, thank you for looking into this and putting it together!
>>>>
>>>> The msnt version looks rather nice, actually.  The 1scf in addition
>>>> might be quite a bit nicer for small-format devices, given the plain font.
>>>>
>>>> The noqq version was generally OK, but there are some places with
>>>> multiple consecutive quick quizzes that look a bit strange, for example,
>>>> the first column of the Counting chapter.  But people who don't like
>>>> being distracted by quick quizzes might like it.  ;-)
>>>>
>>>> What are your thoughts on how to proceed with this?  Were you thinking
>>>> in terms of running it by a few people to get more feedback?  Or did
>>>> you have something else in mind?
>>>
>>> There are a couple of possible approaches.
>>> One downside of enabling "bgqqz" by default is the increase in build
>>> time.  One pdflatex run will take around 50% longer than current
>>> master.  I guess you prefer faster build while preparing new contents.
>>
>> I do, though in this case I was multitasking so wasn't paying attention
>> to the build time.
>>
>>> It would be possible to enable it for the official targets only
>>> when building on a release tag.
>>
>> That makes a lot of sense!  Especially now that I have the
>> utilities/torelease.sh so that I wouldn't have to remember to use the
>> target for releases.  ;-)
>>
>>> As for "noqq", as mentioned in the change log of commit f6852d1ab109
>>> ("Add experimental target 'noqq' (sans inline QuickQuizzes)"),
>>> some of the essential quick quizzes are missing as you see in the
>>> beginning of the Counting chapter.
>>> So "noqq" at the moment is just a PoC which shows that inline
>>> question can be actually removed.
>>> If we add some way to annotate essential quick quizzes and to keep
>>> them in "noqq" build, then this target might become easier to follow.
>>> I can keep noqq build in my tree to further this direction.
>>
>> Another approach is to drop any sign of the quick quizzes from the text.
>>
>> Alternatively, gather them all up at the end of the chapter.  This
>> last could be done by adding a \QuickQuizChapterEnd or some such
>> at the end of each \QuickQuizChapter.
>>
>> But I agree that having some way to mark a few of them as important
>> is a good thing.  In the latter case, the quick quiz could appear
>> both in the text and at the end of the chapter.
>>
>>> The change of \QuickQuiz{} macro will frequently conflict with updates/
>>> additions of quick quizzes. So it would be convenient for me if
>>> you can cherry pick commit 32e96b6c281a ("treewide: Renew format of
>>> Quick Quiz macro") now. This one should not have any effect in
>>> the build results.
>>
>> Done!
>>
>>> Of course, any feedback from select perfbook contributors on "msnt"
>>> and "1csf" is more than welcome.
>>> If you could publish the experimental branch in your tree and invite
>>> prospective readers for their thoughts, I'd highly appreciate them.
>>
>> Branch qqz.2020.03.14a now has these experimental targets.  I will
>> check with a few people, and I can also send a separate email to
>> perfbook@vger.kernel.org.  I would guess that not many will have
>> read this far.  ;-)
>>
>> Something like this?
>>
>> 	Subject: Experimental quick-quiz format at branch qqz.2020.03.14a
>>
>> 	Hello!
>>
>> 	Akira has created a couple of new perfbook build targets
>> 	that use fancier formatting for quick quizzes.  You can
>> 	build with this fanciness by checking out branch qqz.2020.03.14a
>> 	of the perfbook git archive [1], and then typing:
>>
>> 		make msnt  # Double-column format
>> 		make 1csf  # Single-column format
>>
>> 	If you get a chance to do this and look it over, please let
>> 	Akira and I know what you think.  Any reason not to make this
>> 	format be the default for releases and editions?  (The reason
>> 	not to it the default for normal "make" builds is that the
>> 	price of the fanciness is a slower build time.)
>>
>> 	Thoughts?
>>
>> 							Thanx, Paul
>>
>> 	[1] git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/perfbook.git
>>
>> Either way, again thank you for putting this together!
> 
> Although I am not seeing significant slowdowns due to the fancy Quick
> Quizzes, as shown below.  I did these from "make clean", but did not
> do "make clean" between each one.  I also did only a single run of each,
> which is of course a benchmarking crime.  ;-)
> 
> Did I mess up anything else?
> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> make:
> 	real    1m3.368s
> 	user    1m2.785s
> 	sys     0m0.657s
> 
> make msnt:
> 	real    1m1.236s
> 	user    1m0.964s
> 	sys     0m0.249s
> 
> make 1c:
> 	real    1m21.222s
> 	user    1m20.507s
> 	sys     0m0.347s	
> 
> make 1csf:
> 	real    1m27.176s
> 	user    1m26.377s
> 	sys     0m0.350s
> 


Hmm.

To compare the build time at (mostly) equal condition of buffer cache,
I build a target first, remove autodate.tex, and do "time make".
This will time build with 2 runs of pdflatex.

The results look like:

make msnt
rm autodate.tex
time make msnt

at 4c7151455e14:
	real	0m31.193s
	user	0m30.861s
	sys	0m0.214s

at c5b74e161c4e:
	real	0m47.945s
	user	0m47.327s
	sys	0m0.217s


make 1csf
rm autodate.tex
time make 1csf

at 4c7151455e14:
	real	0m30.202s
	user	0m29.849s
	sys	0m0.194s

at c5b74e161c4e:
	real	0m46.285s
	user	0m45.907s
	sys	0m0.205s

Can you reproduce?

        Thanks, Akira

