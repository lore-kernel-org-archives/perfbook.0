Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=XESs9U9s0iiqqj+K3iPlZX/jCAtyKfM93LP+pqclc2k=;
 b=dTMSq/KTt0abAYc2LuyAACVbjx24juqBuxQhHCyhr/xEBA1Qj/Y8qmY9/NUuG5QLkw
 AlC3tPMcxpGUbizm4GXfWQxOKDoPQdXfm/SEYENHzg3tb9g4LFMEQrWMhCpUdJ0WoWH9
 Uj7Awv5Dr3NNWsyFr29b3HcVzeuegvae/Y0Db/p+hxshdCKN2ROhFmtaptmiHJ76UIjt
 C95fUxRN3vhxvvG865N5GJSxO7hdGsEAt7TFOGL7tUVKRtqsD8YpeRwRtv5hjROSfrFc
 vmLfaP75rCpQHT5hh1Ysk/s30CSWa8fHdqtj8HLFH6CknxrYmJGmkWpJEmmvFmMNn4J5
 VATw==
Subject: Re: [PATCH 0/5] Bibliography update round 5
References: <3aa61663-43c2-6663-278a-2554ee4d5736@gmail.com>
 <20170208163747.GO30506@linux.vnet.ibm.com>
 <78D82D63-A7BA-4F43-B320-679D6EA44FD8@gmail.com>
 <20170208211009.GT30506@linux.vnet.ibm.com>
 <52CB7A57-7BDC-42C7-9AD7-5957F5CBC973@gmail.com>
 <20170208214153.GW30506@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <3421a5dd-ab2f-7f47-538b-6f6e7ccbed50@gmail.com>
Date: Thu, 9 Feb 2017 07:21:06 +0900
MIME-Version: 1.0
In-Reply-To: <20170208214153.GW30506@linux.vnet.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/02/08 13:41:53 -0800, Paul E. McKenney wrote:
> On Thu, Feb 09, 2017 at 06:36:18AM +0900, Akira Yokosawa wrote:
>>
>>
>> Akira 
>> (from mobile, might be QP encoded)
>>
>>> On Feb 9, 2017, at 6:10, Paul E. McKenney <paulmck@linux.vnet.ibm.com> wrote:
>>>
>>>> On Thu, Feb 09, 2017 at 05:57:23AM +0900, Akira Yokosawa wrote:
>>>>
>>>>
>>>>> On Feb 9, 2017, at 1:37, Paul E. McKenney <paulmck@linux.vnet.ibm.com> wrote:
>>>>>
>>>>> On Wed, Feb 08, 2017 at 11:54:41PM +0900, Akira Yokosawa wrote:
>>>>>>> From 58a0655ab2b5c555bd19a6d7624a9d4413cf1360 Mon Sep 17 00:00:00 2001
>>>>>> From: Akira Yokosawa <akiyks@gmail.com>
>>>>>> Date: Wed, 8 Feb 2017 23:34:47 +0900
>>>>>> Subject: [PATCH 0/5] Bibliography update round 5
>>>>>>
>>>>>> Hi Paul,
>>>>>>
>>>>>> Here is round 5 of bibliography updates.
>>>>>> Patches 1, 2, and 3 take care of broken urls. Patch 2 contains an
>>>>>> alternative link to a webpage capture.
>>>>>> Patch 4 is cosmetic fix of UCB in author fields
>>>>>> Patch 5 is a different type of update. It adds awareness of "location"
>>>>>> field in "inproceedings" entry. Please see the commit log for details.
>>>>>> I think this is a reasonable change for perfbook.
>>>>>
>>>>> I applied the first four, and might be convinced to apply the fifth.
>>>>> But first a question -- how many changes would be required to bring
>>>>> my old bib entries in line with current practice?
>>>>
>>>> No change is required. Because this change has effect
>>>> only on entries with both "address" and "location".
>>>> I thought I explained this somewhere, but missed to do so.
>>>> Can this clarification convince you?
>>>
>>> Ah, thank you for the clarification!  And on to the next question...
>>>
>>> Does it really make sense for me to have both "address" and "location"
>>> on a given bib entry?  If I am doing something strange (quite likely!),
>>> it is probably better for me to fix my strange bib entries than to modify
>>> the tools.  Especially given the possibility that others might well
>>> harvest bib entries from perfbook.
>>
>> Well, I don't think your usage of "address" field is strange at all.
>> It would be easy to find people who do the same.
>>
>> The fact that genuine alpha style does not recognize "location" entry would support my observation.
> 
> Sorry to continue with the questions, but should perfbook be using
> some other bibliography style?  The current "alpha" was pretty much an
> arbitrary choice.

Hmm...
For example, there is a Q&A here:
http://tex.stackexchange.com/questions/76566/

This answer recommends to use "venue" field for location.

Another Q&A:
http://tex.stackexchange.com/questions/152725/

There seems to be no popular consensus how to handle location of conference
in bibliography...

Thoughts?
                                Thanks, Akira
> 
> 							Thanx, Paul
> 
>>> After all, some of my bib entries were old enough to drink almost a
>>> decade ago.  I guess we can only be thankful that they are unable
>>> to do any driving.  ;-)
>>>
>>>                            Thanx, Paul
>>>
>>
> 
> 

