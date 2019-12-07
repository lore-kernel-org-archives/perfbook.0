Return-Path: <SRS0=gDlb=Z5=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RaY64UHeoBleWlTt1Z/5iUUea/zhi+spw6022XiIeo0=;
        b=PHYiXL3l735H3S21p+fsscLSFsYITVFJI6WCm6mJQEJKD2Xi61/wvpwijrXBlzS3C4
         THD948HSVBTQN6XK53Ynqa9LA0yXpRtyvyl478ldsOPFSUC4iJBZjeGIXcgaOAdTuBCo
         2sZSHsknfTJDelC7qj1fOIpd5u79SkVePyaLbEPm922x86tTEN6VNFjrDaoUCcJ+DSuH
         yLYrR18fvm7A9xeYM4rcQXeEQRilmIh07ZrYb+u9HRPTwZjxC28Z4iXfqRC+BT9GY9CE
         GH2LWkw+DgziEG/cpDFVLZdy48qAKYgURY1KadcAe+2mQiVPJeBbw15bwviKL8isPitX
         ZEAQ==
Subject: Re: [PATCH 0/2] Minor updates
References: <eb5c3f76-c84f-c801-ceb4-27efd64e2d0f@gmail.com>
 <20191207164308.GP2889@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <881ccdd8-1d59-649e-38d1-b65601262f0d@gmail.com>
Date: Sun, 8 Dec 2019 08:41:45 +0900
MIME-Version: 1.0
In-Reply-To: <20191207164308.GP2889@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sat, 7 Dec 2019 08:43:08 -0800, Paul E. McKenney wrote:
> On Sat, Dec 07, 2019 at 01:05:17PM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> This patch set fixes minor issues I noticed while reading your
>> recent updates.
> 
> Queued and pushed, along with a fix to another of my typos, thank
> you very much!
> 
>> Apart from the changes, I'd like you to mention in the answer to
>> Quick Quiz 9.43 that modern Intel CPUs don't execute x86_64
>> instructions directly, but decode them into uOPs (via MOP) and
>> keep them in a uOP cache [1].
>> So the execution cycle is not necessarily corresponds to instruction
>> count, but heavily depends on the behavior of the microarch, which
>> is not predictable without actually running the code. 
>>
>> [1]: https://en.wikichip.org/wiki/intel/microarchitectures/skylake_(server)
> 
> My thought is that I should review the "Hardware and it Habits" chapter,
> add this information if it is not already present, and then make the
> answer to this Quick Quiz refer back to that.  Does that seem reasonable?

Yes, it sounds quite reasonable!

(Skimming through the chapter...)

So Section 3.1.1 lightly touches pipelining. Section 3.2 mostly discusses
memory sub-systems.

Modern Intel architectures can be thought of as superscalar RISC
processors which emulate x86 ISA. The transformation of x86 instructions
into uOPs can be thought of as another layer of optimization
(sometimes "de-optimization" from compiler writer's POV) ;-).

But deep-diving this topic would cost you another chapter/appendix.
I'm not sure if it's worthwhile for perfbook.
Maybe it would suffice to lightly touch the difficulty of
predicting execution cycles of particular instruction streams
on modern microprocessors (not limited to Intel's), and put
a few citations of textbooks/reference manuals.

> 
> Also, I am thinking in terms of a release (not yet an edition) in
> the near term.  Anything else that absolutely must be fixed first?

There remains a couple of ACCESS_ONCE()s. I'm submitting a patch
to get rid of them.  I don't have any other pending urgent fixes
at the moment.

       Thanks, Akira

> 
> 							Thanx, Paul
> 
>>         Thanks, Akira
>> --
>> Akira Yokosawa (2):
>>   toyrcu: Use mathcal O for 'orders of'
>>   defer/rcuusage: Fix typo (that -> than)
>>
>>  appendix/toyrcu/toyrcu.tex | 2 +-
>>  defer/rcuusage.tex         | 2 +-
>>  perfbook.tex               | 2 +-
>>  3 files changed, 3 insertions(+), 3 deletions(-)
>>
>> -- 
>> 2.17.1
>>

