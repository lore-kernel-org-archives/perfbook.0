Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=glmQbM2owO/nzc2/vvMMdYkwOE4G7cUPxalhueW3p6c=;
 b=xojMNMGh7stb0NwPKbhVFmI09E8ZB3NRfxntV3sw0cmAw5v5fGh1rrqQ0+0kox6LrV
 LLYH3KFhLWLmtSV6e38QJEumTiBlprHIJiKRIpiEaJEgSqcgrHdGh7Z7UFylXVIBedKK
 lnj4mLE4RuZgB22/fJUP4YmjUc5ye12CLvfHS/6HP3HCBAHC+6Ac0D+s+6laXKafn8fs
 X4TGWg8TRFQdMzxWIm6AY87KZd/89xRjnQYACKHHNJ4jsySUh2e4/Rl3DLXQz+c470rW
 eUKyrOaJvLCLmkq7DKSdJ2NDiIQ/Vbt43+AnRLblmaz9TznMLz46D3Byl3N6XX0g5DA8
 7U8g==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [RFC PULL] Bibliography URL cleanup
Message-ID: <72375aa0-f2bd-72b0-e39c-69ce8d7ccadc@gmail.com>
Date: Sat, 5 Nov 2016 17:16:19 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

On 2016/10/28, 11:30:38 -0700, Paul E. McKenney wrote:
> On Fri, Oct 28, 2016 at 07:45:16AM +0900, Akira Yokosawa wrote:
[snip]
>> So, these bib files are an library collected for nearly three decades!!!
>> They are invaluable as they are, and I'd appreciate your decision to
>> make them public.
> 
> Unfortunately, many of the comments on the early entries reflect my
> relative youth and impetuosity, so unless or until I get time to edit
> the whole mess so as to avoid offending any number of authors (to say
> nothing of their disciples!), I must keep the originals private.

I see. I misunderstood the circumstances. So you made only a part of your
bib files public.

> 
>> There are two issues in urls in the bib files.
>> One is the inconsistency of format discussed here.
>> The other is the dead links. There are quite a few urls that end up in
>> "not found" now. Maintaining urls would require a great deal of work itself...
>>
>> To make the format consistent, a script would work. But before beginning
>> implementation, we need to clarify what the script would do.
>> So I'll make some sample replacement patches to confirm your preference.
> 
> Sounds good, and I look forward to seeing them!

I said to make "some sample replacement patches", but it became quite
intensive changes. So I'm sending them as a pull request. I don't expect
you to actually pull them as it is, but just to pull them on a local
branch and see what they look like.

>							Thanx, Paul
> 

This request consists of 25 patches. Patches 1 and 2 are improvements of
build scripts to make sure that necessary round of pdflatex is run when
only contents of bibliography are modified.

Patches 3 ("bib: Add missing punctuation in 'url' field") to 9 ("bib:
Remove domain part in doi fields") (except for patch 7) are prerequisite
fixes of bib files to be properly parsed with "alphapf" bibliographystyle,
which is a customized version of standard "alpha" style, to be added in
the following patches. The customization is done by "urlbst" tool provided
in TeX Live.

Patch 7 ("Load 'url' package with 'hyphens' option") is not a fix but gives
room for line breaks within urls.

Patches 10 ("Localize alpha.bst") to 13 ("Use 'alphapf' bibliographystyle
instead of 'alpha'") actually replace bibliographystyle.

Patch 14 ("bib/RCU: Shorten author list of 'Appavoo03a'") is obviously
a workaround. The symptom appears only when "inlinelinks" option of
alphapf.bst is enabled. The root cause of the TeX error is not figured
out yet. Once it is fixed this patch can be reverted.

Patch 15 ("alphapf.bst: Enable 'inlinelinks'") does what the title says.

Patches 16--25 do cleanup of bib/realtime.bib. I selected it because
it contains 48 urls which seemed to be a reasonable number for a trial
patch.

Patch 16 ("bib/realtime: Replace 'Available: ... [Viewed ...]' with
'URL: ...'") does what the (not yet implemented) script I mentioned
earlier would do.

Patches 17 ("bib/realtime: Update url of 'BillInmon2007a'") to
22 ("bib/realtime: Update url of 'StephenShankland20Sep2006'") salvage
some of broken urls.

Patch 23 ("bib/realtime: Mark broken urls as such") marks those urls which
could not be salvaged. You may have other opinion of the form of notice
"[broken, ...]" appended to the de-hyperrefed url.

Patch 24 ("bib/realtime: Use alternative url for
'IBMRealTimeJavaTechnology2007a'") replaces a missing url with what seems
to be close to the site originally cited.

Finally, patch 25 ("bib/realtime: Update 'lastchecked' fields") updates
"lastchecked" fields of urls which is reachable.

Let me explain "inlinelinks" option of "alphapf.bst" style (provided by
"urlbst" tool) a little.

When this option is disabled, urls and dois given in corresponding fields
are explicitly printed in Bibliography. In this case, urls are prefixed
by "URL: " by default.  The string is customizable.  But this looks too
verbose for me.

When this option is enabled, they are embedded as hyperlinks of "title"
strings of the entries. This will generate identical output in print as
standard "alpha" style. When both url and doi is provided in an entry, 
doi has a higher priority to be embedded as a hyperlink.
"alphapf.bst" also defines a field named "lastchecked", which is to be
used to indicate when the url is cited.

Regarding these features of alphapf.bst, I'm suggesting the following
entry formats in .bib files.

For "unpublished" entries,

> @unpublished{DavidAWheeler1996
> ,Author="David A. Wheeler"
> ,Title="Ada, C, C++, and Java vs. The Steelman"
> ,year="1996"
> ,note="URL:
> \url{http://www.adahome.com/History/Steelman/steeltab.htm}
> "
> ,lastchecked="November 4, 2016"
> }

The string "URL: " at the beginning of "note" field corresponds to the
default prefix of url printed when "inlinelinks" option is disabled.
You might feel hesitation in directly putting a string which is
customizable elsewhere (in alphapf.bst). It is possible to define a macro
and use it instead in bib entries, but that would cause trouble when you
do the same changes in your private bib library to be used other than
perfbook. So I directly put the string there. If it is all right to use
a macro, please let me know. I'll do a respin or add a patch just for
the replacement.

For other types of entries such as "conference",

> @conference{PeterOkech2009InherentRandomness
> ,Author="Nicholas {Mc Guire} and Peter Odhiambo Okech and Qingguo Zhou"
> ,Title="Analysis of inherent randomness of the Linux kernel"
> ,Booktitle="Eleventh Real Time Linux Workshop"
> ,month="September"
> ,year="2009"
> ,address="Dresden, Germany"
> ,url={https://www.osadl.org/?id=684}
> ,lastchecked="November 4, 2016"
> }

if you don't want the url to be printed in Bibliography.

Or,

> @conference{JoshTriplett2009PainlessKernel
> ,Author="Josh Triplett"
> ,Title="Painless kernel - removing the {HZ}"
> ,Booktitle="Linux Plumbers Conference"
> ,month="September"
> ,year="2009"
> ,address="Portland, OR, USA"
> ,note="URL:
> \url{http://linuxplumbersconf.org/2009/slides/Josh-Triplett-painless-kernel.pdf}"
> ,lastchecked="November 4, 2016"
> }

if you want the url to be printed.

Dates given in "lastchecked" fields are printed in the form of [cited ...]
when "inlinelinks" option is disabled and both "url" and "lastchecked" fields
exist in an entry. The string "cited " is customizable.

Also, if doi is available, it is expected to be stabler and more preferable than
a raw url.  This type of change is done in patch 21 ("bib/realtime: Replace url
with doi for 'RobertBerry2008IBMSysJ'"). The result is as follows:

> @article{RobertBerry2008IBMSysJ
> ,author="R. F. Berry and P. E. McKenney and F. N. Parr"
> ,title="Responsive systems: An introduction"
> ,Year="2008"
> ,Month="April"
> ,journal="IBM Systems Journal"
> ,volume="47"
> ,number="2"
> ,pages="197-206"
> ,doi="10.1147/sj.472.0197"
> }

Both "doi" and "url" fields can be given in an entry. 

As for broken links, I'm suggesting the following format:

> @unpublished{KristofferBohmann2001a
> ,Author="Kristoffer Bohmann"
> ,Title="Response Time Still Matters"
> ,month="July"
> ,year="2001"
> ,day="12"
> ,note="URL:
> \nolinkurl{http://www.bohmann.dk/articles/response_time_still_matters.html}
> [broken, November 2016]"
> ,lastchecked="July 23, 2007"
> }

This keeps the original "Viewed" date in "lastchecked" field.
Url is de-hyperrefed within \nolinkurl{} command.
If it becomes clear the content is not recoverable, you might want to remove
or modify text where it is cited.

The bad news for the cleanup is that there are a variety of format of "note"
fields found in other .bib files, and it seems not easy to implement a script
to do changes as patch 16 which covers all the cases. It might be easier to
manually edit by using keyboard macro of emacs...

Anyway, following is the pull request of the changes. Please take your time
to see and let me know what you think.

FYI, you might want to pull up to patch 9 ("bib: Remove domain part in doi
fields"). They are improvements and (potential) bug fixes.

                                            Thanks, Akira
----
The following changes since commit bebc538fe4ee24603936e31c981e5342f85b88e5:

  Fix several typos (2016-10-26 16:15:36 -0700)

are available in the git repository at:

  https://github.com/akiyks/perfbook.git bib-url-cleanup-v1

for you to fetch changes up to 1b30f5f91a9bdd133c85d59b41201881b49b8872:

  bib/realtime: Update 'lastchecked' fields (2016-11-05 09:23:25 +0900)

----------------------------------------------------------------
Akira Yokosawa (25):
      runlatex.sh: Add a round for possible bib update
      Makefile: Move $(BIBSOURCES) to dependency of .aux target
      bib: Add missing punctuation in 'url' field
      bib: Fix errors around \url{} command
      bib: Remove nested \url{} in 'url' field
      bib: Add missing \url{} command
      Load 'url' package with 'hyphens' option
      bib/os: Enclose url of 'BenjaminGamsa95a' in \url{} command
      bib: Remove domain part in doi fields
      Localize alpha.bst
      Costomize alpha.bst by 'urlbst' and rename as alphapf.bst
      alphapf.bst: Reorder 'note' field of 'unpublished' entry
      Use 'alphapf' bibliographystyle instead of 'alpha'
      bib/RCU: Shorten author list of 'Appavoo03a'
      alphapf.bst: Enable 'inlinelinks'
      bib/realtime: Replace 'Available: ... [Viewed ...]' with 'URL: ...'
      bib/realtime: Update url of 'BillInmon2007a'
      bib/realtime: Update url of 'KelvinNilsen2007'
      bib/realtime: Replace url of 'PaulEMcKenney2008OLS'
      bib/realtime: Update url of 'SunMicrosystems2008RTSJavaGC'
      bib/realtime: Replace url with doi for 'RobertBerry2008IBMSysJ'
      bib/realtime: Update url of 'StephenShankland20Sep2006'
      bib/realtime: Mark broken urls as such
      bib/realtime: Use alternative url for 'IBMRealTimeJavaTechnology2007a'
      bib/realtime: Update 'lastchecked' fields

 Makefile              |    6 +-
 alphapf.bst           | 1613 +++++++++++++++++++++++++++++++++++++++++++++++++
 appendix/appendix.tex |    2 +-
 bib/RCU.bib           |   27 +-
 bib/RCUuses.bib       |    2 +-
 bib/TM.bib            |   39 +-
 bib/WFS.bib           |   19 +-
 bib/energy.bib        |    4 +-
 bib/hw.bib            |    2 +-
 bib/os.bib            |    6 +-
 bib/parallelsys.bib   |    8 +-
 bib/realtime.bib      |  264 ++++----
 bib/swtools.bib       |   12 +-
 bib/syncrefs.bib      |   10 +-
 perfbook.tex          |    1 +
 utilities/runlatex.sh |   10 +-
 16 files changed, 1851 insertions(+), 174 deletions(-)
 create mode 100644 alphapf.bst

