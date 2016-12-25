Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=PhzRX7+NtzVbgQ9G+Qf6ycNAgRLb+ldd5pmISBUH0PI=;
 b=Ny35K6cwajOKuhny0v896hxW3N1O5Yy7lr+x3nJCKKwXjAw/08eRIF/DlTc8MfgEn8
 mfjhb4/HnRl583KoK8dP2smhgNNFh4/+J17xrnrN4mzAqvueUKULa7EMpLJC75otPMqW
 MDuM4YTIUjrZTlXZ5PhtrrPCN9MrJqCupBAuzUaoIVLr+ZLxjT9ydA79kYGUkeaeRo8Q
 1oe5fgCCHZNoA8GUjB9cwH2ymPxMNuim+KeYNz6C2gUghb0Kp7lkp2LBrZTfTYQdr0OY
 6JG4SQfIk4mwyIn7ojGhW20k5QGaklp+/2zc5KIYE1+cOrxS3Dn3L5Tz0xGUdAuyPIoa
 107A==
Subject: [PATCH 0/2] Add script to convert BiBTeX output (was Re: [RFC PULL]
 Bibliography URL cleanup)
References: <72375aa0-f2bd-72b0-e39c-69ce8d7ccadc@gmail.com>
 <20161106234719.GL24166@linux.vnet.ibm.com>
 <20161224070505.GA16424@linux.vnet.ibm.com>
 <ac74555d-18c3-9bb1-66cc-e2acb3888dcd@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <af2c3345-2e60-1582-1f8f-d2adb3413927@gmail.com>
Date: Sun, 25 Dec 2016 20:42:18 +0900
MIME-Version: 1.0
In-Reply-To: <ac74555d-18c3-9bb1-66cc-e2acb3888dcd@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/12/24 16:36:32 +0900, Akira Yokosawa wrote:
> On 2016/12/24 23:05:05 -0800, Paul E. McKenney wrote:
>> On Sun, Nov 06, 2016 at 03:47:19PM -0800, Paul E. McKenney wrote:
>>> On Sat, Nov 05, 2016 at 05:16:19PM +0900, Akira Yokosawa wrote:
>>>> Hi Paul,
>>>>
>>>> On 2016/10/28, 11:30:38 -0700, Paul E. McKenney wrote:
>>>>> On Fri, Oct 28, 2016 at 07:45:16AM +0900, Akira Yokosawa wrote:
>>>> [snip]
>>>>>> So, these bib files are an library collected for nearly three decades!!!
>>>>>> They are invaluable as they are, and I'd appreciate your decision to
>>>>>> make them public.
>>>>>
>>>>> Unfortunately, many of the comments on the early entries reflect my
>>>>> relative youth and impetuosity, so unless or until I get time to edit
>>>>> the whole mess so as to avoid offending any number of authors (to say
>>>>> nothing of their disciples!), I must keep the originals private.
>>>>
>>>> I see. I misunderstood the circumstances. So you made only a part of your
>>>> bib files public.
>>>>
>>>>>
>>>>>> There are two issues in urls in the bib files.
>>>>>> One is the inconsistency of format discussed here.
>>>>>> The other is the dead links. There are quite a few urls that end up in
>>>>>> "not found" now. Maintaining urls would require a great deal of work itself...
>>>>>>
>>>>>> To make the format consistent, a script would work. But before beginning
>>>>>> implementation, we need to clarify what the script would do.
>>>>>> So I'll make some sample replacement patches to confirm your preference.
>>>>>
>>>>> Sounds good, and I look forward to seeing them!
>>>>
>>>> I said to make "some sample replacement patches", but it became quite
>>>> intensive changes. So I'm sending them as a pull request. I don't expect
>>>> you to actually pull them as it is, but just to pull them on a local
>>>> branch and see what they look like.
>>>
>>> I have pulled thme into akiyks.2016.11.05a, and pushed the first nine
>>> patches.  I am reflecting those changes in my bib sources as well.
>>> Looked sane at first glance, but yes, I need to work out how to handle
>>> the later ones with other documents...
>>
>> And the later .bib edits seem compatible with my current tools, even
>> without the script and .bst changes.  So I have applied them in tandem
>> to my .bib source and to the perfbook bibliography.  I was able to
>> find valid URLs for a few of the entries, so used them instead of
>> \nolinkurl{}, but several do appear to be quite dead.
>>
>> I also applied the alphapf.bst changes, but left inlinelinks disabled
>> for the time being.  (I am concerned about leaving authors off.)
>>
>> Thank you very much for your work on this!!!
> 
> You are welcome!
> 
> Now, the branch "bib-append-doi" might have some conflicts.
> I'll rebase it and submit a v2 of the PULL request.
> 
> inlinelinks seems to have upper limits of around 13 authors.
> I've not found any workaround of the issue...
> Can't you live with a short author field supplemented by a note of
> full authors list?

Hi Paul,

As you have switched to alphapf.bst, I investigated this issue.
It turned out that the length of author list is *not* the root cause.
By changing the length of the list, I unintentionally moved the
page boundary in Bibliography, and that resolved the build error.

The root cause of the error was an href-ed *long* title which crossed
a page boundary.

In perfbook, you can't control page breaks in Bibliography by the
nature of the project. So, I wrote a perl script to convert output of
BiBTeX on the fly.

Now, you can enable "inlinelins". Note that in appending url info to
.bib files, we may need to add more conversion patters. 

                                             Thanks, Akira

--
Akira Yokosawa (2):
  Add script to tweak output of 'alphapf' bibliography stile
  alphapf.bst: Enable 'inlinelinks'

 Makefile                    |  1 +
 alphapf.bst                 |  2 +-
 utilities/tweakhrefinbbl.pl | 37 +++++++++++++++++++++++++++++++++++++
 3 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 utilities/tweakhrefinbbl.pl

-- 
2.7.4

> 
>                                                    Thanks, Akira
> 
>>
>> 							Thanx, Paul
>>
> [snip]
> 

