Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3C2j/k0MARP9tS3gN/B/q2cAqqCZVN2aOnPI4TKHEdY=;
        b=WCUQYt+voPPbAdOOKFUnNYSX2MAw8c6qYRSBwHJ+x/F5Hnmli2MwDE2QJmJVjwwNvI
         u1RwexwYgI2YgAfr7bolN8Qx1d6KX+4IHkIFK6Tr1wR7IhsfmO3RVramFht2RY7huRmB
         4ulWCL7xLXNyNkH8Ccnf4jrKmcFW8d5Ed63TvOq2eL1/OJV/XbLGC2BORJkqqN6+vLoR
         PMTUunv81OjTQMlwKex4fzDMGFKi8y8DbHxryuoKRSfwJpO7q/CbXLld/txqoYljW+9e
         cf1xQmj2B4e7MEjVA4m6FKfoqI8oT7jZXbEe3YBvthqoX2tWGzKAnYeDAz871abqYou+
         dzKQ==
Subject: Re: [GIT PULL v2] formal/dynticks: Employ new scheme for code
 snippets
References: <0245f4c8-5ab2-4622-3e88-a13d64dfccdd@gmail.com>
 <2a97a294-4628-6ec8-0404-493b5c69b9da@gmail.com>
 <20190404192121.GK14111@linux.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <1e8d50f0-6aad-898f-b44a-ec80be401896@gmail.com>
Date: Fri, 5 Apr 2019 07:37:24 +0900
MIME-Version: 1.0
In-Reply-To: <20190404192121.GK14111@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Thu, 4 Apr 2019 12:21:21 -0700, Paul E. McKenney wrote:
> On Fri, Apr 05, 2019 at 12:20:20AM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> On Wed, 3 Apr 2019 00:48:09 +0900, Akira Yokosawa wrote:
>>> Hi Paul,
>>>
>>> The updates of code snippets in formal/dynticks has become a long branch,
>>> and I'm sending this as a pull request.
>>>
>>> Short summary of the changes follows.
>>>
>>> Patch #1 is an independent update of mpostcheck.sh to suppress false
>>> positives on TeX Live 2019, soon to be released this month.
>>>
>>> Patch #2 updates inline (not extracted from CodeSamples) snippets.
>>>
>>> Patches #3 and #4 enhance fcvextract.pl to easily suppress brank lines
>>> from resulting snippets.
>>>
>>> Patch #5 updates code snippets extracted from CodeSamples.
>>>
>>> Patch #6 updates dyntickRCU-base-sl-busted.spin.trail.txt so that
>>> the line counts in the output matches thoes in the updated .spin source.
>>>
>>> Patches #7--#9 are cosmetic fixes and tweaks.
>>>
>>> Patches #10--#14 are workaround tweaks to keep first paragraphs
>>> in sections non-indented when such sections have a floating listing
>>> environment at the beginning. This was an unfortunate regression
>>> in the conversion of schemes using verbbox to those using VerbatimL.
>>> Another option would be to indent every paragraph including the first
>>> one in sections. My preference is to keep first paragraph non-indented.
>>> The use of "\NoIndentAfterThis" just below the section command looks
>>> acceptable to me. Note that it is not robust enough, and there are
>>> two occasions where I need to use \noindent in front of the text of
>>> first paragraphs.
>>>
>>> Patch #15 adds a trivial nbsp.
>>>
>>> Any feedback is welcome!
>>>
>>>         Thanks, Akira
>>> --
>>>
>>> The following changes since commit 71ac1532e501033d9cf6e72d596a307b7df3df4a:
>>>
>>>   toolsoftrade: Fix code listing 4.22 in Chapter 4 (2019-03-19 08:15:52 -0700)
>>>
>>> are available in the Git repository at:
>>>
>>>   https://github.com/akiyks/perfbook.git formal-dyntick-snippet-update-r4
>>>
>>> for you to fetch changes up to 5e2615cf082480f7a0c79f6b873f37c379c24722:
>>>
>>>   formal/dyntickrcu: Add nbsp (2019-04-02 07:53:31 +0900)
>>>
>>> ----------------------------------------------------------------
>>> Akira Yokosawa (15):
>>>       Update mpostcheck.sh to get ready for TeX Live 2019
>>>       formal/dyntickrcu: Employ new scheme for inline snippets
>>>       fcvextract.pl: Add rule to ignore white spaces around comment block
>>>       fcvextract.pl: Add rule for option 'gobbleblank'
>>>       formal/dyntickrcu: Employ new scheme for code snippets
>>>       formal/promela/dyntick: Update .spin.trail.txt file
>>>       treewide: Define and use \rt macro for '-rt'
>>>       formal/dyntickrcu: Tweak appearance
>>>       formal/dyntickrcu: Remove '()' in state names
>>>       formal/dyntickrcu: Tweak indent behind 'listing' environment
>>>       count: Tweak indent behind 'listing' environment
>>>       SMPdesing, locking: Tweak indent behind 'listing' environment
>>>       datastruct, defer: Tweak indent behind 'listing' environment
>>>       formal/spinhint: Tweak indent behind 'listing' environment
>>>       formal/dyntickrcu: Add nbsp
>>>
>>>  .../formal/promela/dyntick/dyntickRCU-base-s.spin  |   37 +-
>>>  .../promela/dyntick/dyntickRCU-base-sl-busted.spin |   35 +-
>>>  .../dyntickRCU-base-sl-busted.spin.trail.txt       |  144 +-
>>>  .../formal/promela/dyntick/dyntickRCU-base-sl.spin |   17 +-
>>>  .../formal/promela/dyntick/dyntickRCU-base.spin    |   46 +-
>>>  .../promela/dyntick/dyntickRCU-irq-nmi-ssl.spin    |   60 +-
>>>  .../formal/promela/dyntick/dyntickRCU-irq-ssl.spin |   41 +-
>>>  .../promela/dyntick/dyntickRCU-irqnn-ssl.spin      |   91 +-
>>>  SMPdesign/beyond.tex                               |    1 +
>>>  advsync/rt.tex                                     |   30 +-
>>>  count/count.tex                                    |    5 +
>>>  datastruct/datastruct.tex                          |    5 +-
>>>  defer/rcuapi.tex                                   |    6 +-
>>>  defer/rcuusage.tex                                 |    3 +-
>>>  formal/dyntickrcu.tex                              | 1733 +++++++-------------
>>>  formal/spinhint.tex                                |    3 +
>>>  locking/locking.tex                                |    3 +
>>>  perfbook.tex                                       |    1 +
>>>  utilities/fcvextract.pl                            |   25 +
>>>  utilities/mpostcheck.sh                            |   16 +-
>>>  20 files changed, 897 insertions(+), 1405 deletions(-)
>>>
>>
>> There was an unnecessary \NoIndentAfterThis in patch #10 in front of
>> a figure environment.
>>
>> I have removed it and rebased the branch to the current master.
>> The updated pull request follows.
>>
>> If you'd like too see the changes as patches, please let me know.
>>
>>         Thanks, Akira
>> -- 
>> The following changes since commit b1ac0aab72275b8410254d4fb23e0b965a0fe5c6:
>>
>>   memorder: Fix two trivial typos (2019-04-02 06:31:12 -0700)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/akiyks/perfbook formal-dyntick-snippet-update-r5
>>
>> for you to fetch changes up to 146213952600d0a6afcc3de09cde7be0a7055700:
>>
>>   formal/dyntickrcu: Add nbsp (2019-04-05 00:01:13 +0900)
>>
>> ----------------------------------------------------------------
>> Akira Yokosawa (15):
>>       Update mpostcheck.sh to get ready for TeX Live 2019
>>       formal/dyntickrcu: Employ new scheme for inline snippets
>>       fcvextract.pl: Add rule to ignore white spaces around comment block
>>       fcvextract.pl: Add rule for option 'gobbleblank'
>>       formal/dyntickrcu: Employ new scheme for code snippets
>>       formal/promela/dyntick: Update .spin.trail.txt file
>>       treewide: Define and use \rt macro for '-rt'
>>       formal/dyntickrcu: Tweak appearance
>>       formal/dyntickrcu: Remove '()' in state names
>>       formal/dyntickrcu: Tweak indent behind 'listing' environment
>>       count: Tweak indent behind 'listing' environment
>>       SMPdesing, locking: Tweak indent behind 'listing' environment
>>       datastruct, defer: Tweak indent behind 'listing' environment
>>       formal/spinhint: Tweak indent behind 'listing' environment
>>       formal/dyntickrcu: Add nbsp
>>
>>  .../formal/promela/dyntick/dyntickRCU-base-s.spin  |   37 +-
>>  .../promela/dyntick/dyntickRCU-base-sl-busted.spin |   35 +-
>>  .../dyntickRCU-base-sl-busted.spin.trail.txt       |  144 +-
>>  .../formal/promela/dyntick/dyntickRCU-base-sl.spin |   17 +-
>>  .../formal/promela/dyntick/dyntickRCU-base.spin    |   46 +-
>>  .../promela/dyntick/dyntickRCU-irq-nmi-ssl.spin    |   60 +-
>>  .../formal/promela/dyntick/dyntickRCU-irq-ssl.spin |   41 +-
>>  .../promela/dyntick/dyntickRCU-irqnn-ssl.spin      |   91 +-
>>  SMPdesign/beyond.tex                               |    1 +
>>  advsync/rt.tex                                     |   30 +-
>>  count/count.tex                                    |    5 +
>>  datastruct/datastruct.tex                          |    5 +-
>>  defer/rcuapi.tex                                   |    6 +-
>>  defer/rcuusage.tex                                 |    3 +-
>>  formal/dyntickrcu.tex                              | 1732 +++++++-------------
>>  formal/spinhint.tex                                |    3 +
>>  locking/locking.tex                                |    3 +
>>  perfbook.tex                                       |    1 +
>>  utilities/fcvextract.pl                            |   25 +
>>  utilities/mpostcheck.sh                            |   16 +-
>>  20 files changed, 896 insertions(+), 1405 deletions(-)
> 
> Pull, thank you!!!
> 
> Apologies for the delay, but one of my children who lives across the
> Pacific was in town for a visit.

Family matter first! :-)

> 
> One nit: The inline listings that break across a column now stick out a
> bit more.

You mean the surrounding frames disturb you?

>            One approach would be to convert them to floating listings.
> Is that the best approach, or would something else work better?

Too may floating listings would overwhelm LaTeX. And long listings over
70 (or 75?) lines can't be made floating.

Disabling frames of VerbatimN in this section should be possible.
let me try.

        Thanks, Akira

> 
> 							Thanx, Paul
> 

