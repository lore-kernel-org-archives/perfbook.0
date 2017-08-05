Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KF7FMpcXproc+13gl/yQzIqDF2O49CkZOA9jC0boDC8=;
 b=pKEhAsokjkwrppPRfPjW083bhahFmQOiX/BCbvTNOQuJ5/odYzkJ+JgNm48qbRaBbL
 NSqeUH2PgDr/XS8TuF/VO4NISdVpvrn30Hj4fDUWx+oix5d9BdillH6+oQcMXh7kkcMY
 xuA2y0PUkTEL4gX8VQSUkQ0sL6qQJ8KitGVCm5r6j9L17qXRmB9gAWINPgoSfwrDDxI6
 W3duhQ0LXJgwhxKZMK7b44pfKiGwGjlaA4HoyuikbOrmIFLH58AOpUcK1FETOCT8TPUE
 KtDHgOpaBJ32RkMG+yjOzWx7uYtIEzyLYuuzzEFR35H+O3UGx3eyVHoc0RrWm61osegM
 FYnQ==
Subject: Re: [PATCH v2 0/8] Add style guide
References: <26a47dec-a9a0-87e6-88c8-b9ba82c477d5@gmail.com>
 <11d41e53-5367-1149-8064-8808696a2c33@gmail.com>
 <20170801204047.GH3730@linux.vnet.ibm.com>
 <068877e2-655b-0d6f-6dab-84d11467d0e5@gmail.com>
 <20170802162910.GY3730@linux.vnet.ibm.com>
 <0a7b7a93-c60c-436f-77a7-e2b27de86a40@gmail.com>
 <20170802224820.GH3730@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <672edb74-85b9-1086-44ee-dba21a0589c9@gmail.com>
Date: Sat, 5 Aug 2017 11:09:42 +0900
MIME-Version: 1.0
In-Reply-To: <20170802224820.GH3730@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/08/02 15:48:20 -0700, Paul E. McKenney wrote:
> On Thu, Aug 03, 2017 at 07:22:07AM +0900, Akira Yokosawa wrote:
>> On 2017/08/02 09:29:10 -0700, Paul E. McKenney wrote:
>>> On Wed, Aug 02, 2017 at 11:57:33PM +0900, Akira Yokosawa wrote:
>>>> On 2017/08/01 13:40:47 -0700, Paul E. McKenney wrote:
>>>>> On Mon, Jul 31, 2017 at 11:43:41PM +0900, Akira Yokosawa wrote:
>>>>>> >From e35b5bc0c56f255caee91054f05a5dd7b824b5fa Mon Sep 17 00:00:00 2001
>>>>>> From: Akira Yokosawa <akiyks@gmail.com>
>>>>>> Date: Mon, 31 Jul 2017 23:20:57 +0900
>>>>>> Subject: [PATCH v2 0/8] Add style guide
>>>>>>
>>>>>> Hi Paul,
>>>>>>
>>>>>> This is the respin I mentioned earlier.
>>>>>> Patch #2 has a few more changes from v1 to modify strings of package name.
>>>>>> Other than that, the end result should be the same as v1.
>>>>>
>>>>> Having a style guide is very good -- for one thing, it allows me to
>>>>> copy and paste from a uniform set of examples as opposed to whatever
>>>>> example happens to be at hand.  ;-)
>>>>>
>>>>> So thank you very much!!!
>>>>
>>>> Glad to know you like it!
>>>>
>>>>>> Note on the status of the floatrow package:
>>>>>>
>>>>>> Current version v0.3b was revised 2009/08/02.
>>>>>> There has been no update since.
>>>>>> I'm not sure if upstreaming is possible.
>>>>>
>>>>> If we have to maintain our own, so it goes.
>>>>>
>>>>> The missing two patches eventually showed up, so I applied them.
>>>>>
>>>>> Some comments:
>>>>>
>>>>> o	I have misgivings about thin spaces instead of commas for
>>>>> 	numbers.  I do understand the concern, given that many of our
>>>>> 	European readers are used to 1.234.567,89 instead of 1,234,567.89.
>>>>> 	My problem is that the NIST convention sounds like one of those
>>>>> 	compromises that makes things worse for everyone.
>>>>>
>>>>> 	But let's see what I think in a year or two.
>>>>
>>>> Maybe in another decade??? ;-)
>>>
>>> Hey, a decade is less than 20% of my lifespan thus far.  ;-)
>>>
>>>>> o	I don't have an objection to the NIST percent convention.
>>>>> 	Let's face it, the percent character is a pain in LaTeX
>>>>> 	no matter what.  ;-)
>>>>>
>>>>> o	I would definitely consider patches to improve the math.
>>>>>
>>>>> o	I like the idea of autonumbering, but not if it requires
>>>>> 	the code being in separate files.
>>>>
>>>> No, separate files are not required.
>>>> The LaTeX source of the code snippet cannot be embedded in \verbbox{}
>>>> because of the LaTeX commands therein, but \verbbox{} of C sources can
>>>> have the same option as the \verbfilebox{}.
>>>> By defining the option as a macro, it would be easier to convert to
>>>> auto-numbering scheme.
>>>
>>> The main value is not the auto-numbering, given that I have to do
>>> tab-to-space conversion anyway, and I have one script that does both.
>>> (See utilities/c2latex.sh and utilities/latex2c.sh.)  Though I do admit
>>> that auto-numbering would make trivial edits easier.
>>>
>>> The win is the prettier format.
>>>
>>>>                                            Now, I have toyed with
>>>>> 	the idea of automatically extracting the code from the
>>>>> 	CodeSamples directory, but haven't yet come up with anything
>>>>> 	satisfactory.
>>>>
>>>> Besides the adjustment of indentation, there need to be some way to
>>>> specify the part of the code you want to include as a code snippet.
>>>
>>> And it might or might not be worth it.  It has not been worth it thus
>>> far, but who knows?
>>>
>>>>> 	The automation would probably make for more failures to
>>>>> 	update line-number references in the text, but then again
>>>>> 	that sometimes happens with the current arrangements.
>>>>>
>>>>> o	I am not all that much a fan of captions at the tops of tables,
>>>>> 	but it is a very common convention, so I will accept patches
>>>>> 	converting tables to that format.
>>>>
>>>> Position of captions can be specified in perfbook.tex for each type of float.
>>>> So it should be easy to choose a layout of your choice without any
>>>> modification of the source of tables, similar to the monospace font choice.
>>>
>>> OK, even better!
>>>
>>>>> o	The ruled code (as in Listings D.3, D.4, and D.5) does look nice.
>>>>> 	Listing D.2 looks quite strange to me.  I would be happy to
>>>>> 	accept patches to make the listings look like Listing D.3.
>>>>
>>>> Before such style adjustment, we need to convert those code snippets
>>>> to the "listings" environment. It will involve changes of label names and
>>>> its references, and the citing words "Figure" need to be changed to "Listing".
>>>>
>>>> Those changes would be larger than the conversion from verbatim to verbbox.
>>>
>>> Maybe chapter by chapter?  Your suggestion of starting with the litmus
>>> tests in the updated memory-barriers section sounds good.  (And yes,
>>> I have been stalled by other work, but will be on this no later than
>>> the week of August 21st.)
>>
>> My suggestion was to employ auto-numbering there, but do you also want
>> the conversion to "listings" environment with the "ruled" appearance at
>> the same time?
>> That would cause inconsistency in the upcoming release, I'm afraid.
>>
>> Well, litmus tests are special and new look only for them might be OK.
>> I can prepare trial patches; one for auto-numbering, another for the
>> "ruled" appearance.
>>
>> Would this work for you?
> 
> That actually sounds like a very good plan -- new format for litmus
> tests, and the code remains the same.  Perhaps the contrast will
> elicit feedback.
> 
> Besides, this is a release, not a full-fledged edition.  For an edition,
> we would want a higher degree of consistency.  ;-)

Paul, there is a bad news.

While I was preparing patches for litmus tests, I tried another package
"caption" to further customize the looks of caption.

However, it turned out that the localized floatrowpf.sty doesn't work
with caption package.
If you enable both packages, pdflatex ends up in a fatal error.

Original floatrow.sty works fine (except for the layout issue in
two-column). So the workaround found at stackexchange should not have
been applied.

I'll revert these 8 patches and try another option "subfig" package instead.

Auto-numbering in litmus tests should work independent of floatrow.
So I'll also submit the patches for them later.

We should suspend conversion of litmus tests to "listing" environment
at the moment.

Sorry for causing all the mess.

Regards,
Akira

> 
> 							Thanx, Paul
> 
>>           Thanks, Akira
>>
>>>
>>>>> o	In https://www.inf.ethz.ch/personal/markusp/teaching/guides/guide-tables.pdf,
>>>>> 	I find the examples from The Economist to be much more attractive
>>>>> 	than his example tables.  Not sure whether LaTeX is up to all
>>>>> 	that without excessive formatting pain, though.  ;-)
>>>>>
>>>>> 	If it is easy to do, it would be interesting to see what
>>>>> 	Table D.2 would look like with The-Economist-style dashed
>>>>> 	lines between the rows.
>>>>
>>>> There is a package named "arydshln". It provides dashed rules for tables.
>>>> But it conflicts with "tabulary" package. I'll see what I can.
>>>
>>> Ouch!  Well, at least a package exists, I suppose.
>>>
>>>>> o	Putting related code side by side as in Listings D.4 and D.5
>>>>> 	could be quite useful.  I did this manually in a few places,
>>>>> 	for example, Figures 9.38-9.40.  Maybe these would look better
>>>>> 	as floatrows.
>>>>>
>>>>> And the comment at the end:
>>>>>
>>>>> % Capitalize initialism:
>>>>> %    Gnu Compiler Collection = GCC
>>>>> %    gcc should be used as a command name in \co{gcc}
>>>>> %    When mentioning GCC's C language, use `GNU C'
>>>>>
>>>>> I have been rather random here, and it would be good to have a
>>>>> standard.  The one above looks fine to me.
>>>>>
>>>>> % Trademarks:
>>>>> %    As the Legal page covers trademarks, there is no need to
>>>>> %    use trademark symbol in the text. They seems to have been
>>>>> %    imported from original publications.
>>>>>
>>>>> Indeed they have!
>>>>>
>>>>> % Power or POWER?
>>>>> %    IBM's trademark page at https://www.ibm.com/legal/us/en/copytrade.shtml#section-P
>>>>> %    lists the following.
>>>>> %        PowerPC
>>>>> %        Power Architecture
>>>>> %        Power
>>>>> %        POWER
>>>>> %        POWER5
>>>>> %        POWER6
>>>>> %
>>>>> %    not Power5, POWER 5, nor Power-5
>>>>>
>>>>> IBM's preferences have changed over time, so I end up importing
>>>>> whatever was the style at the time of publication.  :-/
>>>>>
>>>>> Again, consistency would be good, but IBM's preferences are likely
>>>>> to continue to change over time.
>>>>>
>>>>> What would you suggest?
>>>>
>>>> What about defining a  macro named "\Power{}", which can be used like
>>>> \Power{5} in the source code? If IBM's preference changes, we can
>>>> change the definition accordingly.
>>>
>>> The definition might end up with special cases over time, but better than
>>> massive repeated rounds of search-and-replace.  ;-)
>>>
>>>>> % Ugly line break by \co{}
>>>>> %                                 __
>>>>> %        atomic_store()
>>>>> %
>>>>> %                           seqlock_
>>>>> %        t
>>>>> %
>>>>> %   Is there any way to prevent these breaks?
>>>>> %   Maybe we need an on-the-fly script to convert such \co{}s
>>>>> %   to couples of \co{}s.
>>>>> %   Example:
>>>>> %     \co{__atomic_store()} -> \co{__}\co{atomic_store()}
>>>>> %     \co{seqlock_t} ->        \co{seqlock_}\co{t}
>>>>>
>>>>> As long as it is automated!  ;-)
>>>>>
>>>>> Overall, my main goal here is making the book more attractive and
>>>>> easier to read -- not so much conventions for conventions sake.
>>>>
>>>> Yes, I think I understand.
>>>>
>>>> If I'm guessing right, you are in the middle of updating the memory
>>>> barriers section.
>>>> If the transition to auto-numbering helps in adding new code snippets,
>>>> I can generate an example patch of a (say) litmus test.
>>>>
>>>> The other changes can wait after the upcoming release, I suppose.
>>>
>>> That sounds very good!  I am hoping to release by the end of August or
>>> September, FWIW.
>>>
>>> 							Thanx, Paul
>>>
>>>>         Thanks, Akira
>>>>
>>>>>
>>>>> 							Thanx, Paul
>>>>>
>>>>>>         Thanks, Akira
>>>>>> --
>>>>>> Akira Yokosawa (8):
>>>>>>   Localize floatrow.sty as floatrowpf.sty
>>>>>>   Apply workaround to floatrowpf.sty
>>>>>>   Define 'listing' environment for style guide
>>>>>>   styleguide: Add listing environment examples
>>>>>>   Disable 'floatrow' layout in manually aligned code snippets
>>>>>>   styleguide: Add example of grouping code snippets
>>>>>>   styleguide: Add example of preferred table layout using 'booktabs'
>>>>>>   styleguide: Tweak layout of 'Limitation' table
>>>>>>
>>>>>>  appendix/styleguide/hello.c        |    9 +
>>>>>>  appendix/styleguide/styleguide.tex |  177 ++++-
>>>>>>  defer/rcuusage.tex                 |    6 +-
>>>>>>  floatrowpf.sty                     | 1482 ++++++++++++++++++++++++++++++++++++
>>>>>>  howto/howto.tex                    |    4 +-
>>>>>>  perfbook.tex                       |    4 +
>>>>>>  6 files changed, 1668 insertions(+), 14 deletions(-)
>>>>>>  create mode 100644 appendix/styleguide/hello.c
>>>>>>  create mode 100644 floatrowpf.sty
>>>>>>
>>>>>> -- 
>>>>>> 2.7.4
>>>>>>
>>>>>>
>>>>>
>>>>>
>>>>
>>>> --
>>>> To unsubscribe from this list: send the line "unsubscribe perfbook" in
>>>> the body of a message to majordomo@vger.kernel.org
>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>>
>>>
>>>
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe perfbook" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
> 
> 

