Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:subject:to:references:cc:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=OLAg/amj9bTSf+Hci7dcpbMTvQCdOQU149Vm5noqs7w=;
 b=r6s2nsaAIRW1F7hS+g3XHQ3a3a/XVIu3RhU9Z67iPt6L9TZ3Ds+P+PNoB7NSm5JQLr
 HWAw6d+f8rCC61ujmebI82ospvy8yZnO5T+25ayLSYJpc0Q0YBV1DwW72xkOHzBe+eoK
 ZHaqOlzm313CmWTUtzsIMB5lMAc8ciguHJkqK3YERblM96evcWlXVFnqdjm5YWDnKpnY
 oyLx4P11ZSZlGvvkNXw4IgxtRdPfg/H6UeqEwH2gUg4jYSgvTiyq2yl7b2OfQZo+ahWs
 pNJ8p6KXgflXlkd4SLZTItx0xdg6kDzanR+6NrcA3tkWvi86CkxI07y8SS+miDf4swAo
 04UA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH 0/2] Add script to convert BiBTeX output (was Re: [RFC
 PULL] Bibliography URL cleanup)
References: <72375aa0-f2bd-72b0-e39c-69ce8d7ccadc@gmail.com>
 <20161106234719.GL24166@linux.vnet.ibm.com>
 <20161224070505.GA16424@linux.vnet.ibm.com>
 <ac74555d-18c3-9bb1-66cc-e2acb3888dcd@gmail.com>
 <af2c3345-2e60-1582-1f8f-d2adb3413927@gmail.com>
 <20161225161509.GH3742@linux.vnet.ibm.com>
Message-ID: <54d06a94-11cf-a813-c565-2db831934b14@gmail.com>
Date: Mon, 26 Dec 2016 23:52:40 +0900
MIME-Version: 1.0
In-Reply-To: <20161225161509.GH3742@linux.vnet.ibm.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/12/25 08:15:09 -0800, Paul E. McKenney wrote:
> On Sun, Dec 25, 2016 at 08:42:18PM +0900, Akira Yokosawa wrote:
>> On 2016/12/24 16:36:32 +0900, Akira Yokosawa wrote:
>>> On 2016/12/24 23:05:05 -0800, Paul E. McKenney wrote:
>>>> On Sun, Nov 06, 2016 at 03:47:19PM -0800, Paul E. McKenney wrote:
>>>>> On Sat, Nov 05, 2016 at 05:16:19PM +0900, Akira Yokosawa wrote:
>>>>>> Hi Paul,
>>>>>>
>>>>>> On 2016/10/28, 11:30:38 -0700, Paul E. McKenney wrote:
>>>>>>> On Fri, Oct 28, 2016 at 07:45:16AM +0900, Akira Yokosawa wrote:
>>>>>> [snip]
>>>>>>>> So, these bib files are an library collected for nearly three deca=
des!!!
>>>>>>>> They are invaluable as they are, and I'd appreciate your decision =
to
>>>>>>>> make them public.
>>>>>>>
>>>>>>> Unfortunately, many of the comments on the early entries reflect my
>>>>>>> relative youth and impetuosity, so unless or until I get time to ed=
it
>>>>>>> the whole mess so as to avoid offending any number of authors (to s=
ay
>>>>>>> nothing of their disciples!), I must keep the originals private.
>>>>>>
>>>>>> I see. I misunderstood the circumstances. So you made only a part of=
 your
>>>>>> bib files public.
>>>>>>
>>>>>>>
>>>>>>>> There are two issues in urls in the bib files.
>>>>>>>> One is the inconsistency of format discussed here.
>>>>>>>> The other is the dead links. There are quite a few urls that end u=
p in
>>>>>>>> "not found" now. Maintaining urls would require a great deal of wo=
rk itself...
>>>>>>>>
>>>>>>>> To make the format consistent, a script would work. But before beg=
inning
>>>>>>>> implementation, we need to clarify what the script would do.
>>>>>>>> So I'll make some sample replacement patches to confirm your prefe=
rence.
>>>>>>>
>>>>>>> Sounds good, and I look forward to seeing them!
>>>>>>
>>>>>> I said to make "some sample replacement patches", but it became quite
>>>>>> intensive changes. So I'm sending them as a pull request. I don't ex=
pect
>>>>>> you to actually pull them as it is, but just to pull them on a local
>>>>>> branch and see what they look like.
>>>>>
>>>>> I have pulled thme into akiyks.2016.11.05a, and pushed the first nine
>>>>> patches.  I am reflecting those changes in my bib sources as well.
>>>>> Looked sane at first glance, but yes, I need to work out how to handle
>>>>> the later ones with other documents...
>>>>
>>>> And the later .bib edits seem compatible with my current tools, even
>>>> without the script and .bst changes.  So I have applied them in tandem
>>>> to my .bib source and to the perfbook bibliography.  I was able to
>>>> find valid URLs for a few of the entries, so used them instead of
>>>> \nolinkurl{}, but several do appear to be quite dead.
>>>>
>>>> I also applied the alphapf.bst changes, but left inlinelinks disabled
>>>> for the time being.  (I am concerned about leaving authors off.)
>>>>
>>>> Thank you very much for your work on this!!!
>>>
>>> You are welcome!
>>>
>>> Now, the branch "bib-append-doi" might have some conflicts.
>>> I'll rebase it and submit a v2 of the PULL request.
>>>
>>> inlinelinks seems to have upper limits of around 13 authors.
>>> I've not found any workaround of the issue...
>>> Can't you live with a short author field supplemented by a note of
>>> full authors list?
>>
>> Hi Paul,
>>
>> As you have switched to alphapf.bst, I investigated this issue.
>> It turned out that the length of author list is *not* the root cause.
>> By changing the length of the list, I unintentionally moved the
>> page boundary in Bibliography, and that resolved the build error.
>>
>> The root cause of the error was an href-ed *long* title which crossed
>> a page boundary.
>=20
> Thank you for tracking this down!  This is a title as in the title
> of a citation, or as in the title of an href?  (My guess is the latter,
> but it has been about 20 years since I last used perl.)

Yes, the latter.

>=20
>> In perfbook, you can't control page breaks in Bibliography by the
>> nature of the project. So, I wrote a perl script to convert output of
>> BiBTeX on the fly.
>=20
> Indeed, and this presumably means that the current project is
> randomly vulnerable to this bug.  Are we the only ones to see it?
> If not, is a fix on the way?

If we were the only ones, I could have never found the root cause :-)
I did a search of the error message:
"! pdfTeX error (ext4): \pdfendlink ended up in different nesting
level than \pdfstartlink."

It brought me to a page at:

http://tex.stackexchange.com/questions/1522/pdfendlink-ended-up-in-differen=
t-nesting-level-than-pdfstartlink

This issue was opened 6 years ago. A recent comment (of a workaround) there
was given by Heiko Oberdiek who is one of the current maintainers of hyperr=
ef
package.

There is another page at

http://tex.stackexchange.com/questions/249579/pdfendlink-ended-up-in-differ=
ent-nesting-level-than-pdfstartlink-error-with

It says that two column layout is related to the issue.

You can also find the following description in Limitations section of hyper=
ref's README:

  Links across pages
  In general they have problems:
  * Some driver doesn=92t support them at all (see above).
  * The driver allows it, but the link result might include
  the footer and/or header, or an error message can
  occur sometimes.

So, I can say that this issue is well recognized by the maintainers.

>=20
>> Now, you can enable "inlinelins". Note that in appending url info to
>> .bib files, we may need to add more conversion patters.=20
>=20
> Actually, my current thought is to revert the alpha.bst commits
> pending a fix.  Though I don't see the need to be too quick about
> it, given that it seems to work for both 1c and 2c at the moment.
>=20
> Or am I missing some reason why this cannot be fixed?

It seems unlikely to be fixed soon.

I remember tweaking book.cls to fix indentation behavior in
two column layout. My impression is that two column layout is not
as reliable as one column one...

One idea is to use alphapf.bst only for 1c with inlinelinks enabled.=20

Thoughts?

And I have no objection to reverting commit ca109cf61bbf for now.

                                               Thanks, Akira

> 							Thanx, Paul
>=20
>>                                              Thanks, Akira
>>
>> --
>> Akira Yokosawa (2):
>>   Add script to tweak output of 'alphapf' bibliography stile
>>   alphapf.bst: Enable 'inlinelinks'
>>
>>  Makefile                    |  1 +
>>  alphapf.bst                 |  2 +-
>>  utilities/tweakhrefinbbl.pl | 37 +++++++++++++++++++++++++++++++++++++
>>  3 files changed, 39 insertions(+), 1 deletion(-)
>>  create mode 100644 utilities/tweakhrefinbbl.pl
>>
>> --=20
>> 2.7.4
>>
>>>
>>>                                                    Thanks, Akira
>>>
>>>>
>>>> 							Thanx, Paul
>>>>
>>> [snip]
>>>
>>
>=20
>=20

