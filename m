Return-Path: <SRS0=5VrI=GD=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Kn0HYhB4V5V0KNKe+Jgr2V/DXYsKf91nDFGdsg2Dmps=;
        b=k3PCRMOtkv2cScadHzUPmkiOf/vXq7s/+eGFYR4qAkF7r2l8TMVKNAw8lJkLMy73r3
         jMLrq/8rWezocURzwbNLImlOc4hctVj5sWt7FEwCn6chm7xt1OwARpxx19KuRGARIzyx
         TGgs19/EWGk8F8zler6GE7SxU9UDWpL7zaSPmGUy4N3XVgFaCiemzU/Z6ABaqif4QJ1k
         QAS4qtQgnOfWmv6zFQ+tCjJmrr0NTPWqbHnSEnw0foKwQtjLtnU4P8Lxpwum7SwHK85A
         hzuBOXyr1isYl8IKFNMu0DlNFoctUqxk33DV00fGcbJH0b0tGEjEs7rq2zc84rPXgZrf
         LFWg==
Subject: Re: FYI, Second Edition Release Candidate 1 now available
References: <20201230053728.GA31231@paulmck-ThinkPad-P72>
 <38c34066-da73-eecc-cbd6-4e24db5ab367@gmail.com>
 <20201230161346.GM2657@paulmck-ThinkPad-P72>
 <20201230185933.GP2657@paulmck-ThinkPad-P72>
 <68e8db69-c787-9a41-a311-b084eb6897b1@gmail.com>
 <20201231040409.GQ2657@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <ce22345f-9dd8-e7ae-ea07-09992615ee84@gmail.com>
Date: Thu, 31 Dec 2020 13:43:36 +0900
MIME-Version: 1.0
In-Reply-To: <20201231040409.GQ2657@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Wed, 30 Dec 2020 20:04:09 -0800, Paul E. McKenney wrote:
> On Thu, Dec 31, 2020 at 08:21:58AM +0900, Akira Yokosawa wrote:
>> On Wed, 30 Dec 2020 10:59:33 -0800, Paul E. McKenney wrote:
>>> On Wed, Dec 30, 2020 at 08:13:46AM -0800, Paul E. McKenney wrote:
>>>> On Wed, Dec 30, 2020 at 08:44:30PM +0900, Akira Yokosawa wrote:
>>>>> Hi Paul,
>>>>>
>>>>> On Tue, 29 Dec 2020 21:37:28 -0800, Paul E. McKenney wrote:
>>>>>> Hello!
>>>>>>
>>>>>> Release Candidate 1 of the Second Edition is now available, and I have
>>>>>> started a prototype blog entry: https://paulmck.livejournal.com/59935.html
>>>>>> Please let me know of any omissions or errors in this blog entry.
>>>>>
>>>>> Wouldn't it be worth while mentioning the availability of the "nq" build
>>>>> targets?
>>>>
>>>> Good point!  How about like this?
>>>>
>>>> 	Those who find Quick Quizzes distracting will be happy to learn
>>>> 	that "make nq" relegates both the quizzes and their answers to
>>>> 	the end of each chapter, similiar to common practice in textbooks.
>>>>
>>>> Maybe I should also show what "make help" and "make help-full" print out.
>>>
>>> And I went ahead and did both, using the output of "make help-full" to
>>> motivate the mention of "make nq".
>>>
>>> Thoughts?
>>
>> A bit lengthy, but looks good to me!
> 
> I could drop the output of "make help-full" and just call out "make nq"
> as one example from that list.  Would that be better?

Or you could put a relevant part of the output of "make help-full" instead:

    [...]
    Experimental targets:
      Full,              Abbr.
      perfbook-qq.pdf,   qq:   framed Quick Quizzes
      perfbook-nq.pdf,   nq:   no inline Quick Quizzes (chapterwise Answers)
    [...]
          ("1cqq", "1cnq", and so on disable 2-column mode.)

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>>>>> PS:
>>>>>
>>>>> My experiment on index annotations is progressing but slowly.
>>>>> Besides the hierarchical indexing, I'm attempting to make use of
>>>>> the "glossaries" or the "glossaries-extra" package to manage indexing
>>>>> of acronyms.
>>>>> Once it becomes stable enough, I'll submit an RFC pull request.
>>>>> That would be after the release of Second Edition.  
>>>
>>> And this sounds very good!
>>>
>>> 							Thanx, Paul
>>>
>>>>>>                                                                    I expect
>>>>>> to post it to my social media accounts in a few days.
>>>>>>
>>>>>> And thank you all for your interest in and contributions to perfbook!
>>>>>>
>>>>>> 							Thanx, Paul
>>>>>>
