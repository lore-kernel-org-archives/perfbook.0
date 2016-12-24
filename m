Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:references:from:to:cc:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=6u/uVHti1lCdxBoOqIe+fP7JqVRJN3C/F/7en17TLCA=;
 b=bk8dV7u0Cz+6tzo9XXVgU7VPtCXRXSSwKt7JrZ3wLRM1xmbJOMYRahUyXOgxLBT+SI
 k1KAYpUlilIvyaOLPXkNHHlmmVnvFb2KJoeDiQOSC7s1pjb8XGJT/ov/gzLqvSDNaFFm
 Jq4WoHoA1h0LQlZ9AYCfjkBdUEfPAh5eg+DrujclJ/7RkAR3cfQx1Y5pilZSJSwcyQSe
 Sx40llLIm6O0eg0gaA0Thj9CPqPVjyOZy+FnBDKx9CNPcgROL8d0aQ6exsPot+ynOs//
 OY2w05u3FoZNETCMayjU65RddapZJm8n9Hw9p2WdbtI64ES/B+dnNaKI5UFzIb2GNbRQ
 EvuQ==
Subject: Re: [RFC PULL] Bibliography URL cleanup
References: <72375aa0-f2bd-72b0-e39c-69ce8d7ccadc@gmail.com>
 <20161106234719.GL24166@linux.vnet.ibm.com>
 <20161224070505.GA16424@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <ac74555d-18c3-9bb1-66cc-e2acb3888dcd@gmail.com>
Date: Sat, 24 Dec 2016 16:36:32 +0900
MIME-Version: 1.0
In-Reply-To: <20161224070505.GA16424@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/12/24 23:05:05 -0800, Paul E. McKenney wrote:
> On Sun, Nov 06, 2016 at 03:47:19PM -0800, Paul E. McKenney wrote:
>> On Sat, Nov 05, 2016 at 05:16:19PM +0900, Akira Yokosawa wrote:
>>> Hi Paul,
>>>
>>> On 2016/10/28, 11:30:38 -0700, Paul E. McKenney wrote:
>>>> On Fri, Oct 28, 2016 at 07:45:16AM +0900, Akira Yokosawa wrote:
>>> [snip]
>>>>> So, these bib files are an library collected for nearly three decades!!!
>>>>> They are invaluable as they are, and I'd appreciate your decision to
>>>>> make them public.
>>>>
>>>> Unfortunately, many of the comments on the early entries reflect my
>>>> relative youth and impetuosity, so unless or until I get time to edit
>>>> the whole mess so as to avoid offending any number of authors (to say
>>>> nothing of their disciples!), I must keep the originals private.
>>>
>>> I see. I misunderstood the circumstances. So you made only a part of your
>>> bib files public.
>>>
>>>>
>>>>> There are two issues in urls in the bib files.
>>>>> One is the inconsistency of format discussed here.
>>>>> The other is the dead links. There are quite a few urls that end up in
>>>>> "not found" now. Maintaining urls would require a great deal of work itself...
>>>>>
>>>>> To make the format consistent, a script would work. But before beginning
>>>>> implementation, we need to clarify what the script would do.
>>>>> So I'll make some sample replacement patches to confirm your preference.
>>>>
>>>> Sounds good, and I look forward to seeing them!
>>>
>>> I said to make "some sample replacement patches", but it became quite
>>> intensive changes. So I'm sending them as a pull request. I don't expect
>>> you to actually pull them as it is, but just to pull them on a local
>>> branch and see what they look like.
>>
>> I have pulled thme into akiyks.2016.11.05a, and pushed the first nine
>> patches.  I am reflecting those changes in my bib sources as well.
>> Looked sane at first glance, but yes, I need to work out how to handle
>> the later ones with other documents...
> 
> And the later .bib edits seem compatible with my current tools, even
> without the script and .bst changes.  So I have applied them in tandem
> to my .bib source and to the perfbook bibliography.  I was able to
> find valid URLs for a few of the entries, so used them instead of
> \nolinkurl{}, but several do appear to be quite dead.
> 
> I also applied the alphapf.bst changes, but left inlinelinks disabled
> for the time being.  (I am concerned about leaving authors off.)
> 
> Thank you very much for your work on this!!!

You are welcome!

Now, the branch "bib-append-doi" might have some conflicts.
I'll rebase it and submit a v2 of the PULL request.

inlinelinks seems to have upper limits of around 13 authors.
I've not found any workaround of the issue...
Can't you live with a short author field supplemented by a note of
full authors list?

                                                   Thanks, Akira

> 
> 							Thanx, Paul
> 
[snip]

