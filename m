Return-Path: <SRS0=VxP2=5A=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WUzrDbb5AZtIqyxjamtvAc/8JEuaTUcNTDaYVUqkk3s=;
        b=hi36O7R7A/n22yhMCXVYVCU12+8Y0jdbZ/kwGAU/0v67PnAtg4kqLJNg8BHgJXK15W
         1B2GXZgIqZmJtdBOeR9eAxwfBsTEYLi82hDkaoQB5kGK56ztjRh3tRdyKGKI5+wCqs4z
         c1/VcuhowkWJD6Zs/G0HCGIk7zOjNvGsge0y4GLJgnj+px8IZfKacC1/aEF235qpgKDP
         2IHMjxOB/LvO51hWTj/1sdW8KP9cCSp6FbrKeXKvXzDN6vudsHxV+M1KPMEEUOsIl9pp
         CrhYMqtCMhLt/5BfI4fjlilLbqFqR600z65IOHMPww4UOf/opxzIwhajFse4k/HStqaU
         57PA==
Subject: Re: [RFC NOT PULL] Experiment to add background to question part of
 QQZ
References: <1bca91e5-b192-85db-2035-6e524ee1cb57@gmail.com>
 <20200315032641.GR3199@paulmck-ThinkPad-P72>
 <b3918d50-838e-68a8-5a39-158ab1442ef5@gmail.com>
 <20200315152039.GS3199@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a032431c-9a0d-eff3-e25c-d18099a0499a@gmail.com>
Date: Mon, 16 Mar 2020 07:35:47 +0900
MIME-Version: 1.0
In-Reply-To: <20200315152039.GS3199@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sun, 15 Mar 2020 08:20:39 -0700, Paul E. McKenney wrote:
> On Sun, Mar 15, 2020 at 01:33:36PM +0900, Akira Yokosawa wrote:
>> On Sat, 14 Mar 2020 20:26:41 -0700, Paul E. McKenney wrote:
>>> On Sun, Mar 15, 2020 at 09:40:37AM +0900, Akira Yokosawa wrote:
>>>> Hi Paul,
>>>>
>>>> I have been experimenting to make question part of QQZ stand out.
>>>> At the moment, official targets are not affected by the change.
>>>> You can see the new look by building targets "msnt" and "1csf".
>>>>
>>>> Another added target "noqq" is an experiment to remove inline questions.
>>>> Anchors to the QQAs in Appendix E are presented at the right side of
>>>> the column.
>>>>
>>>> To make noqq to work, I need to change the \QuickQuiz{} macro format
>>>> so that the question part is enclosed in "{ ... }".
>>>>
>>>> Please give them a try and share your thoughts.
>>>
>>> Interesting, thank you for looking into this and putting it together!
>>>
>>> The msnt version looks rather nice, actually.  The 1scf in addition
>>> might be quite a bit nicer for small-format devices, given the plain font.
>>>
>>> The noqq version was generally OK, but there are some places with
>>> multiple consecutive quick quizzes that look a bit strange, for example,
>>> the first column of the Counting chapter.  But people who don't like
>>> being distracted by quick quizzes might like it.  ;-)
>>>
>>> What are your thoughts on how to proceed with this?  Were you thinking
>>> in terms of running it by a few people to get more feedback?  Or did
>>> you have something else in mind?
>>
>> There are a couple of possible approaches.
>> One downside of enabling "bgqqz" by default is the increase in build
>> time.  One pdflatex run will take around 50% longer than current
>> master.  I guess you prefer faster build while preparing new contents.
> 
> I do, though in this case I was multitasking so wasn't paying attention
> to the build time.
> 
>> It would be possible to enable it for the official targets only
>> when building on a release tag.
> 
> That makes a lot of sense!  Especially now that I have the
> utilities/torelease.sh so that I wouldn't have to remember to use the
> target for releases.  ;-)
> 
>> As for "noqq", as mentioned in the change log of commit f6852d1ab109
>> ("Add experimental target 'noqq' (sans inline QuickQuizzes)"),
>> some of the essential quick quizzes are missing as you see in the
>> beginning of the Counting chapter.
>> So "noqq" at the moment is just a PoC which shows that inline
>> question can be actually removed.
>> If we add some way to annotate essential quick quizzes and to keep
>> them in "noqq" build, then this target might become easier to follow.
>> I can keep noqq build in my tree to further this direction.
> 
> Another approach is to drop any sign of the quick quizzes from the text.
> 
> Alternatively, gather them all up at the end of the chapter.  This
> last could be done by adding a \QuickQuizChapterEnd or some such
> at the end of each \QuickQuizChapter.
> 
> But I agree that having some way to mark a few of them as important
> is a good thing.  In the latter case, the quick quiz could appear
> both in the text and at the end of the chapter.
> 
>> The change of \QuickQuiz{} macro will frequently conflict with updates/
>> additions of quick quizzes. So it would be convenient for me if
>> you can cherry pick commit 32e96b6c281a ("treewide: Renew format of
>> Quick Quiz macro") now. This one should not have any effect in
>> the build results.
> 
> Done!
> 
>> Of course, any feedback from select perfbook contributors on "msnt"
>> and "1csf" is more than welcome.
>> If you could publish the experimental branch in your tree and invite
>> prospective readers for their thoughts, I'd highly appreciate them.
> 
> Branch qqz.2020.03.14a now has these experimental targets.  I will
> check with a few people, and I can also send a separate email to
> perfbook@vger.kernel.org.  I would guess that not many will have
> read this far.  ;-)
> 
> Something like this?
> 
> 	Subject: Experimental quick-quiz format at branch qqz.2020.03.14a
> 
> 	Hello!
> 
> 	Akira has created a couple of new perfbook build targets
> 	that use fancier formatting for quick quizzes.  You can
> 	build with this fanciness by checking out branch qqz.2020.03.14a
> 	of the perfbook git archive [1], and then typing:
> 
> 		make msnt  # Double-column format
> 		make 1csf  # Single-column format
> 
> 	If you get a chance to do this and look it over, please let
> 	Akira and I know what you think.  Any reason not to make this
> 	format be the default for releases and editions?  (The reason
> 	not to it the default for normal "make" builds is that the
> 	price of the fanciness is a slower build time.)
> 
> 	Thoughts?
> 
> 							Thanx, Paul
> 
> 	[1] git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/perfbook.git
> 
> Either way, again thank you for putting this together!

Looking at the branch again, I see some of the commits are unrelated to
the format of QQZs.

I'll respin the branch and send you those changes as patches to be
applied to master.  Then I'll prepare another experimental branch
and do a V2 of the "RFC NOT PULL".

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>>>> The following changes since commit c811727b76356d53dff7614d3361353527953dd1:
>>>>
>>>>   legal: Add a statement of the obvious (2020-03-14 14:20:11 -0700)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>   https://github.com/akiyks/perfbook.git tags/for-paul-2020.03.15a
>>>>
>>>> for you to fetch changes up to c5b74e161c4e1e6e5009f95c8e96cc34d906fe14:
>>>>
>>>>   defer/seqlock: Move figure env next to 1st paragraph (2020-03-15 08:51:18 +0900)
>>>>
>>>> ----------------------------------------------------------------
>>>> Akira Yokosawa (6):
>>>>       treewide: Renew format of Quick Quiz macro
>>>>       howto: Update Answer to QQZ 1.3 to mention inline QQA is not possible
>>>>       Add experimental target 'noqq' (sans inline Quick Quizzes)
>>>>       EXP qqz.sty: Add background color to Quiz part of Quick Quizzes
>>>>       intro: Use 'VerbatimU' env for command output
>>>>       defer/seqlock: Move figure env next to 1st paragraph
>>>>
>>>>  Makefile                                  |   8 +-
>>>>  SMPdesign/SMPdesign.tex                   |  42 ++--
>>>>  SMPdesign/criteria.tex                    |   6 +-
>>>>  SMPdesign/partexercises.tex               |  72 +++---
>>>>  advsync/rcu.tex                           |  24 +-
>>>>  advsync/rt.tex                            |  60 ++---
>>>>  appendix/questions/after.tex              |  12 +-
>>>>  appendix/questions/concurrentparallel.tex |  12 +-
>>>>  appendix/questions/ordering.tex           |   6 +-
>>>>  appendix/toyrcu/toyrcu.tex                | 162 ++++++-------
>>>>  appendix/whymb/whymemorybarriers.tex      |  84 +++----
>>>>  count/count.tex                           | 384 +++++++++++++++---------------
>>>>  cpu/cpu.tex                               |   6 +-
>>>>  cpu/hwfreelunch.tex                       |   6 +-
>>>>  cpu/overheads.tex                         |  31 +--
>>>>  cpu/overview.tex                          |  12 +-
>>>>  cpu/swdesign.tex                          |  12 +-
>>>>  datastruct/datastruct.tex                 |  84 +++----
>>>>  debugging/debugging.tex                   | 152 ++++++------
>>>>  defer/hazptr.tex                          |  42 ++--
>>>>  defer/rcuapi.tex                          |  54 ++---
>>>>  defer/rcuexercises.tex                    |  12 +-
>>>>  defer/rcufundamental.tex                  |  36 +--
>>>>  defer/rcuintro.tex                        |  42 ++--
>>>>  defer/rcurelated.tex                      |   6 +-
>>>>  defer/rcuusage.tex                        |  78 +++---
>>>>  defer/refcnt.tex                          |  30 +--
>>>>  defer/seqlock.tex                         |  62 ++---
>>>>  defer/whichtochoose.tex                   |  18 +-
>>>>  easy/easy.tex                             |  18 +-
>>>>  formal/axiomatic.tex                      |  36 +--
>>>>  formal/dyntickrcu.tex                     |  90 +++----
>>>>  formal/formal.tex                         |  12 +-
>>>>  formal/ppcmem.tex                         |  30 +--
>>>>  formal/spinhint.tex                       |  48 ++--
>>>>  future/formalregress.tex                  |  42 ++--
>>>>  future/htm.tex                            |  54 ++---
>>>>  future/tm.tex                             |   6 +-
>>>>  howto/howto.tex                           |  30 ++-
>>>>  intro/intro.tex                           |  94 ++++----
>>>>  locking/locking-existence.tex             |  18 +-
>>>>  locking/locking.tex                       | 156 ++++++------
>>>>  memorder/memorder.tex                     | 246 +++++++++----------
>>>>  owned/owned.tex                           |  42 ++--
>>>>  perfbook.tex                              |   8 +
>>>>  qqz.sty                                   |  53 ++++-
>>>>  together/applyrcu.tex                     |  30 +--
>>>>  together/hash.tex                         |   6 +-
>>>>  together/refcnt.tex                       |  42 ++--
>>>>  toolsoftrade/toolsoftrade.tex             | 210 ++++++++--------
>>>>  utilities/extractqqz.sh                   |   8 +-
>>>>  51 files changed, 1449 insertions(+), 1385 deletions(-)
