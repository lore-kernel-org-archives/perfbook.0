Return-Path: <SRS0=0yOs=GC=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pBlPTN+QO7wL9aBY49Ei1nmizDpkoynEVqFW1IeukP0=;
        b=BXbmj0GScWypXWGgHmLbgcv8vPV9Njrt/yXPMwyeC6qrP2+ODrV2OOCeTr9NpvEriW
         eDl7z78Z3ye3m5wKh8mIItTMo0PWi882+lb0cp3xa2WhJ0wvlRc8WwqSn1biv5j59OXE
         iukiQ9ecczeJeoLcMSMfKlELsC2NiyfT+EIAS8/UnW4K8/gY9w/iFZR94JyszdTHDENg
         WnbnlkN4vfPMNNv+SAo1fgtmgY6GF81ouh2z7XMj58ouJelarcgt/CJ72J8V7EiyAKHM
         ALWw3uDK3iani0lkG4UGiDMUfiU/i/o9sbOqSVxkatCEOx65BpKPzp8QiO4EsfRoTeRS
         f/tA==
Subject: Re: FYI, Second Edition Release Candidate 1 now available
References: <20201230053728.GA31231@paulmck-ThinkPad-P72>
 <38c34066-da73-eecc-cbd6-4e24db5ab367@gmail.com>
 <20201230161346.GM2657@paulmck-ThinkPad-P72>
 <20201230185933.GP2657@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <68e8db69-c787-9a41-a311-b084eb6897b1@gmail.com>
Date: Thu, 31 Dec 2020 08:21:58 +0900
MIME-Version: 1.0
In-Reply-To: <20201230185933.GP2657@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Wed, 30 Dec 2020 10:59:33 -0800, Paul E. McKenney wrote:
> On Wed, Dec 30, 2020 at 08:13:46AM -0800, Paul E. McKenney wrote:
>> On Wed, Dec 30, 2020 at 08:44:30PM +0900, Akira Yokosawa wrote:
>>> Hi Paul,
>>>
>>> On Tue, 29 Dec 2020 21:37:28 -0800, Paul E. McKenney wrote:
>>>> Hello!
>>>>
>>>> Release Candidate 1 of the Second Edition is now available, and I have
>>>> started a prototype blog entry: https://paulmck.livejournal.com/59935.html
>>>> Please let me know of any omissions or errors in this blog entry.
>>>
>>> Wouldn't it be worth while mentioning the availability of the "nq" build
>>> targets?
>>
>> Good point!  How about like this?
>>
>> 	Those who find Quick Quizzes distracting will be happy to learn
>> 	that "make nq" relegates both the quizzes and their answers to
>> 	the end of each chapter, similiar to common practice in textbooks.
>>
>> Maybe I should also show what "make help" and "make help-full" print out.
> 
> And I went ahead and did both, using the output of "make help-full" to
> motivate the mention of "make nq".
> 
> Thoughts?

A bit lengthy, but looks good to me!

        Thanks, Akira

> 
>>> PS:
>>>
>>> My experiment on index annotations is progressing but slowly.
>>> Besides the hierarchical indexing, I'm attempting to make use of
>>> the "glossaries" or the "glossaries-extra" package to manage indexing
>>> of acronyms.
>>> Once it becomes stable enough, I'll submit an RFC pull request.
>>> That would be after the release of Second Edition.  
> 
> And this sounds very good!
> 
> 							Thanx, Paul
> 
>>>>                                                                    I expect
>>>> to post it to my social media accounts in a few days.
>>>>
>>>> And thank you all for your interest in and contributions to perfbook!
>>>>
>>>> 							Thanx, Paul
>>>>
