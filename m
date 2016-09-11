Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=XAuE+BxUtHfMktWcp+kdi4DPyHzGO1ZdfA53HbPZt60=;
 b=tNdHganyUiB66UlQBC2/Drh8GtDMTbPUWQGOWN604ydABGu/iS+qcoh/W8PkPlbfNa
 WDZAA6RTd+XHoxw1sDPOyWqZFZG02J3R7NZzCc7Pxhc9zZy4VgjBkJ3CSw7LeSdZbenC
 cxz2ZihZM9/bhQEA8RtiKnf7oZJTRvyIEK5TuXIR19e+iBDSy21qfF+fnjqBdK4QaiOZ
 6bFGlfwZumPXXX2Nt9j5KLM7rh0ipKj7/LaIPyEHLOmwmbWGbqhNtV0octIVfs7/170R
 8xnrtu0FzpZo1tMsV2+pa2m+aA6WVXfWTCWBPJUytZu1mKf3lY6hVei+oAPwOeIdxF6U WC4g==
Subject: Re: [PATCH] TRIAL: Indentation tweaks around 'verbbox' environment
References: <b76692c9-330c-2531-67dd-b7f445644227@gmail.com>
 <017bdee4-c318-f7f5-95bf-b213b4df86e5@gmail.com>
 <20160908111622.GM3663@linux.vnet.ibm.com>
 <ed8f9798-0ff5-7d96-ef30-b2157af7c4fd@gmail.com>
 <20160910162819.GV32751@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5ccea7ae-5aa7-7149-52a8-1e371a193807@gmail.com>
Date: Sun, 11 Sep 2016 11:10:37 +0900
MIME-Version: 1.0
In-Reply-To: <20160910162819.GV32751@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/09/11 1:28, Paul E. McKenney wrote:
> On Sat, Sep 10, 2016 at 09:19:32AM +0900, Akira Yokosawa wrote:
>> On 2016/09/08 04:16:22 -0700, Paul E. McKenney wrote:
>>> On Thu, Sep 08, 2016 at 12:58:53AM +0900, Akira Yokosawa wrote:
>>>> On 2016/09/08 0:47, Akira Yokosawa wrote:
>>>>> >From 480c37c4749ae4957791636e84e77566265613c2 Mon Sep 17 00:00:00 2001
>>>>> From: Akira Yokosawa <akiyks@gmail.com>
>>>>> Date: Thu, 8 Sep 2016 00:20:29 +0900
>>>>> Subject: [PATCH] TRIAL: Indentation tweaks around 'verbbox' environment
>>>>>
>>>>> This is a trial commit to avoid the side-effect of the "verbbox"
>>>>> environment, i.e., when it is used just after a section heading,
>>>>> the following paragraph loses implicit non-indentation.
>>>>>
>>>>> This commit moves such a "verbbox" environment *before* the section
>>>>> heading.
>>>>>
>>>>> There are also cases where two "verbbox" environments are placed just
>>>>> after section headings. To accommodate such cases, one of such
>>>>> "verbbox" need to be replaced with "myverbbox" environment to give
>>>>> another temporary verbatimbox content holder.
>>>>>
>>>>> This commit includes an example of such a case.
>>>>>
>>>>> Note that the "myverbbox" environment is provided in recent versions
>>>>> of the "verbatimbox" package, namely after v3.0.
>>>>>
>>>>> If you have older versions of "verbatimbox" package, you need to
>>>>> update. Also the newer one requires the "readarray" package.
>>>>>
>>>>> Please make sure you have those required packages.
>>>>>
>>>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>>>>> ---
>>>>>  defer/toyrcu.tex | 31 +++++++++++++++++--------------
>>>>>  1 file changed, 17 insertions(+), 14 deletions(-)
>>>>>
>>>>
>>>> Hi Paul,
>>>>
>>>> So, this is what occurred to me.
>>>> The main idea is to move "verbbox" environment before the section heading.
>>>> This patch contains only a small samples.
>>>> Does this level of modification acceptable in your viewpoint?
>>>>
>>>> One concern is the requirement of fairly new "verbatimbox" environment.
>>>> On Ubuntu 12.04, the one installed in texlive is too old.
>>>> On Ubuntu 14.04 and 16.04, it contains newer versions.
>>>
>>> I am currently running Ubuntu 14.04, so it would work.  But is there
>>> anything that could be done to make "verbbox" avoid causing this change?
>>>
>>
>> So I tried several modification of verbatimbox.sty to do so.
>> But what I could do was to add a variant of "verbbox" named "verbboxh"
>> which passes "afterheading"-ness to the next paragraph.
>>
>> The way to do this can be found at
>> http://tex.stackexchange.com/questions/23265/suppressing-indentation-of-the-next-paragraph
>>
>> But when I made the same change to "verbbox" without \@afterindentfalse to
>> make it "afterheading"-ness aware, the resulting pdf looked weird with irregular
>> vertical spacing before section headings.
>>
>> It's far beyond my capability to figure out how to fix this.
>>
>> Using the variant "verbboxh" in the LaTeX sources would be essentially the
>> same as adding explicit \noindent's from a maintainer's viewpoint.
>>
>> So moving the position of "verbbox" environment seems a good compromise for now.
>> And by doing so, the position would be a good reminder of the side-effect.
>>
>> What do you think?
> 
> Would it make sense to file a bug report against verbbox and wait until
> the bug is fixed?
> 

Well, it seems like we don't need to file a bug report.
We can use "verbbox" env within a "figure" env, and doing so, the "afterheading"-ness
of the first paragraph can be preserved.

I'll compose a sample patch for you to confirm this.

Without your encouragement to let me avoid invasive modifications,
I could not have noticed this.

                                          Thanks, Akira
                                                 

> 								Thanx, Paul
> 
>>                                          Thanks, Akira
>>
>>
>>> 							Thanx, Paul
>>>
>>>
>>
> 
> 

