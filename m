Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RM+T0L/27cs01fMBpCcSBQioxXVaOfLAM1hLBEvyoa4=;
 b=U61uwwyRxcct8CHJBM1gbmi0Pj+VGjM7E9UnisOsuBUoxTHyN3lW1MqeslUd3rKszO
 z2/JGoBKZR3JTglAnzuPvY/HaU1bVI3zJM4A/PxqptEhhNWSat1eXpcZy7YoOOfC3Att
 njbRGhYVwr9qVCJNBjf5GyvW8XB6UH/qiyGDA4XGojvOBa8e0DO5afJ0UKKuMuKV4CDh
 zgdcVXPZW2rT4LlE515B4tmR/SU35vTMpVAQ8jXhKCh6HuCgYTWEt7HeCMqXyJ6xRLbj
 mwCgUruDvR3MRINYwqhLpszcM70vVxvA6Mg5IGk5fROrsxl6tbfOGhVDZCzwaPsauULx
 lgXQ==
Subject: Re: Julia language
References: <31ffe8fa-8787-7554-ce37-285cb0961a26@gmail.com>
 <20171118191913.GJ3624@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <af00bd8f-245b-7a11-b110-91d6b95d152e@gmail.com>
Date: Sun, 19 Nov 2017 09:30:54 +0900
MIME-Version: 1.0
In-Reply-To: <20171118191913.GJ3624@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/11/19 4:19, Paul E. McKenney wrote:
> On Fri, Nov 17, 2017 at 12:43:19AM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> Have you heard of "Julia" language?
>>
>> JFYI,
>> As can be seen in its official page at https://julialang.org/ and a Wikipedia
>> article at https://en.wikipedia.org/wiki/Julia_(programming_language),
>> it looks like one of promising answers to perfbook's Section 2.2 "Parallel
>> Programming Goals".
>>
>> As long as high-performance number crunching is concerned, it claims to have
>> comparable performance to C, with a programming productivity much better
>> than C + MPI.
>>
>> Note: I'm not a user of the language at the moment. I just heard of it at
>> a twitter hashtag #julialang.
>>
>> I'd like you to check it up and (hopefully) update the above mentioned
>> section in perfbook.
> 
> I had heard of it, but I had not heard of it being seriously proposed
> as the answer to Section 2.2.  I have added it to todo.txt with your
> Reported-by.
> 
> Have you or has someone you know used this for a large parallel-programming
> project?  (Just looking for some real-world confirmation.)

So you want a secondary-source info on the real-world use?

I learned of Julia from Gen Kuroki's twitter activity since this June.
He is a mathematician at Tohoku Univiersity, and experimenting/demonstrating
Monte Carlo analysis of several statistic problems using Julia (on a Windows PC!).
But what he is doing right now doesn't qualify as a _large_ parallel-programming
project.

There is a case-studies page at https://juliacomputing.com/case-studies/,
but this should be regarded as a primary source.

One of the case study, "Deep Learning for Medical Diagnosis" at
https://juliacomputing.com/case-studies/ibm.html, looks like a collaboration
of IBM and Juliacomputing.

Could this qualify as a real-world large parallel programming example?

        Thanks, Akira

> 
> 							Thanx, Paul
> 
> 

