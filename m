Return-Path: <SRS0=XbAt=GE=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=35KQJyaQB6KosvQuBtcSJmPM1HFIhDNxrVGuh4oeFzw=;
        b=U8JX/KtOKbyH+8PiT5i83kl44neYDULeBF6Rq8twJEs1DS5WD2d6wh9eDNrH/qK56l
         bE5W2CF2jmN/+juA541VVUca8dG6p1/fKWM6jaAp8UB8ycv2EK2+BnHC9/Y7YVhrCFJ8
         Hg73F8WGnbK92MVMg8q8j6DaTsweVN+aaJmqBybHDq4uHQsT92grDgZHWnHuRA6L/lD+
         KhAUh62ei83jyykipgS5rJpMewL3jjaUt32AUdfutUr1ToJ5tBp6CucMGdT0iPHk0CHO
         1Zo+a8KS9RU2nufGm8zm/gliTeQ9PWE1wvZuL0XJyVLQ14IjBTer/2K46uGIqso9+TXD
         3dWQ==
Subject: Re: FYI, Second Edition Release Candidate 1 now available
References: <20201230053728.GA31231@paulmck-ThinkPad-P72>
 <38c34066-da73-eecc-cbd6-4e24db5ab367@gmail.com>
 <20201230161346.GM2657@paulmck-ThinkPad-P72>
 <20201230185933.GP2657@paulmck-ThinkPad-P72>
 <68e8db69-c787-9a41-a311-b084eb6897b1@gmail.com>
 <20201231040409.GQ2657@paulmck-ThinkPad-P72>
 <ce22345f-9dd8-e7ae-ea07-09992615ee84@gmail.com>
 <20201231203601.GR2657@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6e46043c-999b-48db-3ec1-44a4dc303686@gmail.com>
Date: Fri, 1 Jan 2021 10:30:00 +0900
MIME-Version: 1.0
In-Reply-To: <20201231203601.GR2657@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Thu, 31 Dec 2020 12:36:01 -0800, Paul E. McKenney wrote:
> On Thu, Dec 31, 2020 at 01:43:36PM +0900, Akira Yokosawa wrote:
>> On Wed, 30 Dec 2020 20:04:09 -0800, Paul E. McKenney wrote:
>>> On Thu, Dec 31, 2020 at 08:21:58AM +0900, Akira Yokosawa wrote:
>>>> On Wed, 30 Dec 2020 10:59:33 -0800, Paul E. McKenney wrote:
>>>>> On Wed, Dec 30, 2020 at 08:13:46AM -0800, Paul E. McKenney wrote:
>>>>>> On Wed, Dec 30, 2020 at 08:44:30PM +0900, Akira Yokosawa wrote:
>>>>>>> Hi Paul,
>>>>>>>
>>>>>>> On Tue, 29 Dec 2020 21:37:28 -0800, Paul E. McKenney wrote:
>>>>>>>> Hello!
>>>>>>>>
>>>>>>>> Release Candidate 1 of the Second Edition is now available, and I have
>>>>>>>> started a prototype blog entry: https://paulmck.livejournal.com/59935.html
>>>>>>>> Please let me know of any omissions or errors in this blog entry.
>>>>>>>
>>>>>>> Wouldn't it be worth while mentioning the availability of the "nq" build
>>>>>>> targets?
>>>>>>
>>>>>> Good point!  How about like this?
>>>>>>
>>>>>> 	Those who find Quick Quizzes distracting will be happy to learn
>>>>>> 	that "make nq" relegates both the quizzes and their answers to
>>>>>> 	the end of each chapter, similiar to common practice in textbooks.
>>>>>>
>>>>>> Maybe I should also show what "make help" and "make help-full" print out.
>>>>>
>>>>> And I went ahead and did both, using the output of "make help-full" to
>>>>> motivate the mention of "make nq".
>>>>>
>>>>> Thoughts?
>>>>
>>>> A bit lengthy, but looks good to me!
>>>
>>> I could drop the output of "make help-full" and just call out "make nq"
>>> as one example from that list.  Would that be better?
>>
>> Or you could put a relevant part of the output of "make help-full" instead:
>>
>>     [...]
>>     Experimental targets:
>>       Full,              Abbr.
>>       perfbook-qq.pdf,   qq:   framed Quick Quizzes
>>       perfbook-nq.pdf,   nq:   no inline Quick Quizzes (chapterwise Answers)
>>     [...]
>>           ("1cqq", "1cnq", and so on disable 2-column mode.)
> 
> Good point, updated.  Further thoughts?

Looks nice!

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>>>>>>> PS:
>>>>>>>
>>>>>>> My experiment on index annotations is progressing but slowly.
>>>>>>> Besides the hierarchical indexing, I'm attempting to make use of
>>>>>>> the "glossaries" or the "glossaries-extra" package to manage indexing
>>>>>>> of acronyms.
>>>>>>> Once it becomes stable enough, I'll submit an RFC pull request.
>>>>>>> That would be after the release of Second Edition.  
>>>>>
>>>>> And this sounds very good!
>>>>>
>>>>> 							Thanx, Paul
>>>>>
>>>>>>>>                                                                    I expect
>>>>>>>> to post it to my social media accounts in a few days.
>>>>>>>>
>>>>>>>> And thank you all for your interest in and contributions to perfbook!
>>>>>>>>
>>>>>>>> 							Thanx, Paul
>>>>>>>>
