Return-Path: <SRS0=deQ9=5L=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uPyW8oub8L+NpOkiIqysheokoa+I4ksEFZO9fkK85kc=;
        b=iciFSo9T0ePF8CmqOnbbO9RVW5JO3QiLzhdelpJxxiZWgLkcrvNbfbkYUG45yAAy7f
         NQ4kZlELeSTQDA0dKJCELlOEeODo2+xtc+TGhI3d8AGpAsvw887MuZfQi7h74//h7999
         D1clKPnnVX5vdIvmBPVUlSl2wdyh3X+lUtcTn0gyvJ4wPQH9wuVS0zH5qOggtFGmblzY
         N0uqkokg3WfXvzOvXbE3AL38g7UEoFNB6SKRw5a3io90OJFby3pIfontqyGwrfQwvo/y
         iWavRQUmPa5pV0v30HoFxjnnmLvq27vTW1+781NvyK3z9uvxxWaaNRIeUX4iG15urJF7
         x1KQ==
Subject: Re: [RFC PULL v2] Add experimental targets 'nq' and '1cnq' (sans
 inline Quick Quizzes)
References: <26b6add2-3819-dffe-38b1-d62a566e9a7b@gmail.com>
 <c74f4988-f95c-759f-5b37-56dc6f92ba07@gmail.com>
 <20200326160551.GL19865@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <96069999-bbe5-ff3c-9ac7-42c8904c9aef@gmail.com>
Date: Fri, 27 Mar 2020 07:56:39 +0900
MIME-Version: 1.0
In-Reply-To: <20200326160551.GL19865@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Thu, 26 Mar 2020 09:05:51 -0700, Paul E. McKenney wrote:
> On Fri, Mar 27, 2020 at 12:04:52AM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> This is the rebased pull request of "noqq" branch.
>> The conflict was easy to resolve.
>> I added several commits since v1 (was [RFC NOT PULL]).
>>
>> As this branch does not change any behavior of official targets,
>> I think it is safe for you to pull if you'd like to.
>>
>> Changes since v1:
>>
>>     Target name changes and additions:
>>         - qq:    2c with framed Quick Quizzes (was 2cqq)
>>         - 1cqq:  1c with framed Quick Quizzes
>>         - nq:    2c without inline Quick Quizzes (was noqq)
>>         - 1cnq:  1c without inline Quick Quizzes
>>
>>             Note: Existing targets for 2c layout do not have
>>                   "2c" except for the default "2c".
>>
>>     Accuracy fix of cross links to framed Quick Quizzes
>>
>>     Treewide annotation of Quick Quizzes for nq build
>>
>>     Target names updates in synctex-forward.sh
>>
>>     Minor fixes in Quick Quizzes 5.49 and 5.52
>>
>> Try "make help" to see which target does what.
> 
> That "make help" is great, thank you very much!!!
> 
> I believe that the new options for quick quizzes will be quite useful
> as well.
> 
> I have pulled this and pushed out the result.

Thanks!

> 
> A few questions on "make help":
> 
> o	Why no .pdf on the perfbook-qq, perfbook-1cqq, perfbook-nq,
> 	perfbook-1cnq, and perfbook-tcb full-length targets?

Umm, I'll fix them soon.

> 
> o	Would it make sense to just say prepending "1c" gets you
> 	single-column output unless otherwise stated?  Doing this
> 	would shorten the output by quite a bit.

Unfortunately, prepending "1c" doesn't work at the moment.
E.g. "1chb" or "1cmsnt" doesn't work.

I _guess_ such restructuring of target rules might be possible
without adding every rule in the Makefile.

> 
> o	Can some of the old defaults be retired?  For example,
> 	perfbook-tcb, perfbook-msns.pdf, and perfbook-mss.pdf?
>

Maybe.

They can be useful in testing the portability of .tex code base
by using fonts of different width and detecting minor issues such
as orphan headings.
 
> o	Would it make sense for "make help" to omit the experimental
> 	targets, with something like "make fullhelp" printing the
> 	current list?  The last line of "make help" might point to
> 	"make fullhelp" (or whatever you decide to call it) so that
> 	people can easily get at the full list.

Good point!
It would be much better than the official targets scrolled away.
I'll give it a try.

> 
> And a question on quick quizzes.  This is a real question that I have
> not really thought about, so I have no idea what makes sense here.
> Would it be reasonable to have a "textbook" or "academic" build target
> that collected the non-essential quick quizzes at the end of each chapter,
> omitting them from the text (though maybe leaving a marker as nq currently
> does, or not, I have no idea)?  If this does make sense, it would probably
> be necesary to place a new macro at the end of each quick-quiz chapter.
> 
> Thoughts?

This would involve splitting qqz.tex into chapter-wise .tex files, which
should be possible.

Most important thing you'd need is to make those question parts
independent of context in the text.
Quite a few questions look dependent on where they are.
Also, we need to pick essential quizzes or rephrase the text around them.
This requires us to review the story line of the whole text in the "nq"
build.

So the addition of such a framework would be the easy part,
improving the text would be much time consuming, I guess.

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>> Thanks, Akira
>>
>> PS:
>>
>> As for -hb build, I've found a clue to use "geometry" package as a
>> workaround. It looks promising.
>>
>> Enabling qqzbg at release tags for official targets is next in my
>> todo list.
>>
>> --
>> The following changes since commit dcb1d4e43b2c1edba5a61bd0e63e0804478bf520:
>>
>>   toolsoftrade: Improve rwlockscale.sh sampling strategy (2020-03-25 07:14:47 -0700)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/akiyks/perfbook.git tags/for-paul-2020.03.26a
>>
>> for you to fetch changes up to 1dd2b89ab3e7bb64a380d7ccef7033757dd442ef:
>>
>>   Makefile: Add and rename targets for framed and no Quick Quizzes (2020-03-26 23:23:10 +0900)
>>
>> ----------------------------------------------------------------
>> Akira Yokosawa (10):
>>       qqz.sty: Add background color to Quiz part of Quick Quizzes
>>       Add experimental target 'noqq' (sans inline Quick Quizzes)
>>       Permit consecutive QQs to appear in a framed box
>>       qqz.sty: Make noqq's Appendix E look same as that of 2cqq's
>>       qqz.sty: Improve accuracy of cross links
>>       treewide: Use macros for consecutive quick quizzes
>>       synctex-forward: Add recently added targets
>>       qqz.sty: Add comment on how to use new sets of macros
>>       count: Wordsmith Quick Quizzes 5.49 and 5.52
>>       Makefile: Add and rename targets for framed and no Quick Quizzes
>>
>>  Makefile                             |  34 ++++-
>>  SMPdesign/SMPdesign.tex              |  16 +-
>>  SMPdesign/partexercises.tex          |  32 ++--
>>  advsync/rt.tex                       |  16 +-
>>  appendix/toyrcu/toyrcu.tex           |  88 ++++++-----
>>  appendix/whymb/whymemorybarriers.tex |  40 ++---
>>  count/count.tex                      | 277 +++++++++++++++++++----------------
>>  cpu/overheads.tex                    |  16 +-
>>  datastruct/datastruct.tex            |  16 +-
>>  debugging/debugging.tex              |  72 +++++----
>>  defer/hazptr.tex                     |  16 +-
>>  defer/rcuapi.tex                     |  32 ++--
>>  defer/rcuexercises.tex               |  17 ++-
>>  defer/rcufundamental.tex             |  16 +-
>>  defer/rcuintro.tex                   |  32 ++--
>>  defer/rcuusage.tex                   |  32 ++--
>>  defer/refcnt.tex                     |  16 +-
>>  defer/seqlock.tex                    |  40 ++---
>>  formal/axiomatic.tex                 |  16 +-
>>  formal/dyntickrcu.tex                |  48 +++---
>>  formal/ppcmem.tex                    |  14 +-
>>  formal/spinhint.tex                  |  33 +++--
>>  future/formalregress.tex             |  32 ++--
>>  future/htm.tex                       |  24 +--
>>  howto/howto.tex                      |  24 +--
>>  intro/intro.tex                      |  32 ++--
>>  locking/locking-existence.tex        |  16 +-
>>  locking/locking.tex                  |  48 +++---
>>  memorder/memorder.tex                |  96 ++++++------
>>  owned/owned.tex                      |  16 +-
>>  perfbook.tex                         |   7 +
>>  qqz.sty                              | 133 ++++++++++++++++-
>>  together/refcnt.tex                  |  24 +--
>>  toolsoftrade/toolsoftrade.tex        | 104 +++++++------
>>  utilities/extractqqz.sh              |   8 +-
>>  utilities/synctex-forward.sh         |   2 +-
>>  36 files changed, 892 insertions(+), 593 deletions(-)
>>  
