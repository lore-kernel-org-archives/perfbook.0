Return-Path: <SRS0=0242=I3=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Yi016EATBrKnuK5lF1Hdw0332i95nxSnjmQA3mCabI8=;
        b=mKOGPV7hq3GIYwHpRo+TSqrdN0QLWJ4MkKWVPlYaqm96l8PqH0gJF8H17E60NJqvrq
         xm+Je9q38ouZbirTFzuhc9/hKu+O0F5EW09Z6StoMLRFEv8xpvgz5LZ+ArdFMF7iiaz3
         PRrK9A4tuPNexyhuIZhIIadbGV7Lneh1ggK+Z9qeM06ETvoJ/+4JGXHfk35N6+GBwu+R
         /qWACbMICYCOoaCGFLlxZ03I0K/Nt4fRrLkqJKhBVb1oJcyb9XQZRSQJc/f1QHllbZln
         9UK2sJ+hLSMilYI3Cp4evjbrEO+WHyFqcY8wY9TI6CIt3wN63i59HfR2C317I74TscMm
         qEqg==
Subject: Re: [PATCH -perfbook 0/5] Misc fixes and updates
References: <d63ba139-abc7-3837-b44a-294a48a1b216@gmail.com>
 <20210328160836.GT2696@paulmck-ThinkPad-P72>
 <418b8e1f-0030-c577-afe8-b868e7e0984f@gmail.com>
 <20210329000656.GU2696@paulmck-ThinkPad-P72>
 <dcc0e180-4df3-2f9e-cff3-30afbde74275@gmail.com>
 <20210329153210.GV2696@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a9a0d100-5d81-6356-2a14-0e25f3357db8@gmail.com>
Date: Tue, 30 Mar 2021 08:24:22 +0900
MIME-Version: 1.0
In-Reply-To: <20210329153210.GV2696@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Balbir Singh <bsingharora@gmail.com>, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

+CC: Barbir

On Mon, 29 Mar 2021 08:32:10 -0700, Paul E. McKenney wrote:
> On Mon, Mar 29, 2021 at 08:54:05PM +0900, Akira Yokosawa wrote:
>> On Sun, 28 Mar 2021 17:06:56 -0700, Paul E. McKenney wrote:
[...]
>>> Would it help reduce Makefile complexity by having the default target
>>> do fancy Quick Quizzes like it does for releases and editions?
>>
>> Yes, it is high time to do some refactoring of make targets.
>>
>> Before changing Makefile, how does the provisional "make help-full" text
>> at the bottom look to you?  Still too complex?
>>
>> Its commit log would be something like:
>>
>> EXP Makefile: (help text only) Refactor build targets
>>     
>> Main points:
>>     
>>     o Promote qq+ix (- highlighting) -> default "perfbook.pdf"
>>     o "df" (draft) as the same as current default (no QQZ framing, no indexing)
>>       for quicker build
>>     o "ix" for draft check of indexing (with indexed terms/names highlighted),
>>       no QQZ framing
>>     o Promote "nq", "sf" "sfnq" as semi-official targets. (some might prefer
>>       sans serif font for ebook)
>>     o Prepare ebook specific targets "eb", "ebnq", "ebsf", "ebsfnq", "ebix",
>>       and "ebdf" (independent of PERFBOOK_PAPER).
>>     o Prepare 1c* variants for all the 2c targets. (there is no "1ceb*" nor
>>       "eb1c*", as "eb" implies "1c".)
>>
>> Not-Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> 
> As long as "make help" is short, I am fine with "make help-full" being
> long and detailed.  It does look like some of the options might be ready
> to be removed, but I will trust your judgment on that.

Looks like there is some room to simplify.
See inline comment below.

> 
> 							Thanx, Paul
> 
>>         Thanks, Akira
>>
>>>
>>> 							Thanx, Paul
[...]
>>
>> ------
>> $ make help-full
>> Official targets (Latin Modern Typewriter for monospace font):
>>   Full,              Abbr.
>>   perfbook.pdf,      2c:   (default) 2-column layout
>>   perfbook-1c.pdf,   1c:   1-column layout
>> Note:
>>   Official targets now enable indexing and Quick-Quiz framing.
>>
>> Set env variable PERFBOOK_PAPER to change paper size:
>>    PERFBOOK_PAPER=A4: a4paper
>>    PERFBOOK_PAPER=HB: hard cover book
>>    PERFBOOK_PAPER=EB: ebook reader, always 1c layout (WIP)

I think "PERFBOOK_PAPER=EB" is not necessary if we add ebook-size
specific targets like "eb", "ebnq", "ebsf", "ebsfnq", "ebix",
and "ebdf". (See "Prefixed targets:" below.)

Balbir, do you mind if I drop support of PERFBOOK_PAPER=EB ?

        Thanks, Akira

>>    other (default):   letterpaper
>> Note:
>>   Modified PERFBOOK_PAPER takes effect after "make paper-clean".
>>
>> Paper-size specific targets (independent of PERFBOOK_PAPER):
>>   perfbook-lt.pdf,   lt:   2c layout on letterpaper
>>   perfbook-hb.pdf,   hb:   2c layout for hard cover book
>>   perfbook-a4.pdf,   a4:   2c layout on a4paper
>>   perfbook-eb.pdf,   eb:   1c layout for ebook reader (WIP)
>>
>> Semi-official targets:
>>   Full,              Abbr.
>>   perfbook-nq.pdf,   nq:   2c without inline Quick Quizzes (chapterwise Q&As)
>>   perfbook-sf.pdf,   sf:   2c with sans serif font
>>   perfbook-sfnq.pdf, sfnq: sf + nq
>>
>> Targets for draft check, non-framed Quick Quizzes (quicker build)
>>   perfbook-ix.pdf,   ix:   for draft check, with indexed terms highlighted
>>   perfbook-df.pdf,   df:   for draft check, without indexing
>>
>> Prefixed targets:
>>   "1c*" such as "1cnq", "1csf", and "1cix" are for 1c-layout.
>>   "ebnq", "ebsf", "ebsfnq", "ebix", and "ebdf" are for ebook-size 1c-layout,
>>      independent of PERFBOOK_PAPER. (WIP)
>>
>> Experimental targets:
>>   perfbook-msnt.pdf, msnt: newtxtt as monospace (non-slashed 0)
>>   perfbook-mstx.pdf, mstx: txtt as monospace
>>   perfbook-msr.pdf,  msr:  regular thickness courier clone as monospace
>>   perfbook-msn.pdf,  msn:  narrow courier clone as monospace
>>
>> Historical targets:
>>   perfbook-tcb.pdf,  tcb:  table caption at bottom (First Edition)
>>   perfbook-msns.pdf, msns: non-scaled courier (First Edition)
>>   perfbook-mss.pdf,  mss:  scaled courier (default in early 2017)
>>
>> Notes:
>>   - "msnt" requires "newtxtt". "mstx" is a fallback target for older TeX env.
>>   - "msr" and "msn" require "nimbus15".
>>   - "msn" doesn't cover bold face monospace.
>>   - "sf" requires "newtxsf".
>>   - All the targets except for "msn" use "Latin Modern Typewriter" font
>>     for code snippets.
>> ------
>>
