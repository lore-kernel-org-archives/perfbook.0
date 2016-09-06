Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=jiWaDRs5eJT47ka7jgMxPZ2RE0czmUZE0l6femF1xEs=;
 b=aQWRJSaQjXKpA8WSUcR8rI/5/3VZPATxPk9CDZm6aPeaKpOefch5qgwAoUYCLaovzS
 G0vTzk60EB/FnXm1G3/SzrdxDn3vr8fMq2/+9wkBvAgcloRBNMTNrqPPFHq8K2HuHrdm
 nl4TlFKMQb3CKXn5xvKPIpfeBOgimaSzw2ui1Z1JHJSVgp3ia3RJD7w+6Qpot1doG0bg
 l51Aj5teecs72F8d44ypWLl65KO0qdmZCzfrVsN5rCkPGnkJnGL21430gfblfXNjtCRQ
 ABV1QHHHHCU4lWNaXVfObK+ZZQAbJpZVYlv5nCtUMQItQ9uA9YjEzvKX5FJPa0oC3Mzz
 uMSA==
Subject: Re: [PATCH v2] treewide: Add \noindent where necessary
References: <7080142c-a8de-3fb8-c7e0-de2939730beb@gmail.com>
 <309e736b-ba53-5e55-ea23-8fc69959375c@gmail.com>
 <20160906120126.GG3663@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a05f42f5-b7e2-725a-2332-b178f2310cd2@gmail.com>
Date: Tue, 6 Sep 2016 22:18:53 +0900
MIME-Version: 1.0
In-Reply-To: <20160906120126.GG3663@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/09/06 21:01, Paul E. McKenney wrote:
> On Tue, Sep 06, 2016 at 08:17:29PM +0900, Akira Yokosawa wrote:
>> On 2016/09/05 23:47:56 +0900, Akira Yokosawa wrote:
>>> >From 3590a93264e8497f5464397de1644076cd28f467 Mon Sep 17 00:00:00 2001
>>> From: Akira Yokosawa <akiyks@gmail.com>
>>> Date: Sun, 4 Sep 2016 08:01:50 +0900
>>> Subject: [PATCH v2] treewide: Add \noindent where necessary
>>>
>>> When there is some environment definition just after a section
>>> heading, the implicit non-indentation of first paragraph is lost.
>>>
>>> This seems inconsistent.
>>>
>>> This commit adds "\noindent"s just before such first paragraphs
>>> to recover the non-indentation.
>>>
>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>>
>> Hi Paul,
>>
>> I'd like to retract this patch.
>> I suppose you don't like explicit \noindent in the text either.
>>
>> I prefer fixing the position of first paragraphs in the latex source.
>> That might cause the variation in position of floating figures, but
>> should be acceptable.
>>
>> What do you think?
> 
> My first thought was "just make the environment do it", thinking that
> this was of of the origpub macros.
> 
> Another thought is to forbid use of floating figures immediately after
> section headers.  That would be a bit of an ugly change, but much easier
> to maintain against changing LaTeX versions.
> 
> I am mostly working on code, so now is a good time for invasive changes
> like this, but I do want to avoid the current change just resulting in
> the need for many future changes.  Especially given differences between
> different formatting options.  ;-)

Indeed.

About the origpub macro involved in one of the hunks, if you replace it
with standard \label{}, the paragraph under the figure is still indented.

Regarding the figure itself as a paragraph, the paragraph under it is
the second one and indentation should be expected.

Addition of \noindent there was unnecessary from the beginning.

The other hunks are all related to the "verbbox" environment, which I
introduced.  That means I'm shooting myself in the foot... 

So moving floating figures seems to be necessary only when they are
related to "verbbox".

It would be even better if we can fix the side-effect of "verbbox"
environment. Let me seek this approach first.

                                        Thanks, Akira

> 
> 							Thanx, Paul
> 
> 

