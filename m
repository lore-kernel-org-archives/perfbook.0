Return-Path: <SRS0=ujuK=RD=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MrudpbXH8gpr8coIIJDSnxId44weEOtmH2TQqWcpzpQ=;
        b=JMyU66l2BGXmyuI7CWGpOOBYKWY4FBZXnZgNvjz/O1GJRIAR9Pe8EEOLZwVG2pUZ7V
         KdTaDr7danzJXlHoaO4snQr8qGVydrGvMDhjT+lJps/M4IFFSnXlZHKH+uXBQ18UOmz2
         8FM/JCMVhxSqrG49gQVXWB42p5G+PXUbgmPTKxQVFb1VufjExMqN7bjXY31n+U+TbbNv
         wTdNqnlMiWfx7znB+FgtPKP7qKo4v6yvl+Rsh4wwr34r9dcUh6mIt6rY2MpWKj2iZXX+
         3zLgZ4NgFBGaaWU4WXOaDhoLJv1Bcg1+Aa2yOMDkgF8zbsXTKzrkhX2goNyIpDgUSww4
         7dKQ==
Subject: Re: [PATCH -perfbook] defer: Retouch RCUusecases.svg by Inkscape
 1.1.1
References: <df989143-2daf-1f80-7800-d514a21c9607@gmail.com>
 <3d3d0475-50aa-28dd-92a0-56ad7ba4dca1@gmail.com>
 <20211216152304.GL641268@paulmck-ThinkPad-P17-Gen-1>
 <f7e2e4d6-09bb-a173-c3e8-3246577a943d@gmail.com>
 <20211217154544.GR641268@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <0019eed7-68cd-9f63-748a-a4eca186b4e6@gmail.com>
Date: Sat, 18 Dec 2021 22:36:13 +0900
MIME-Version: 1.0
In-Reply-To: <20211217154544.GR641268@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Fri, 17 Dec 2021 07:45:44 -0800, Paul E. McKenney wrote:
> On Fri, Dec 17, 2021 at 10:17:40AM +0900, Akira Yokosawa wrote:
>> On Thu, 16 Dec 2021 07:23:04 -0800, Paul E. McKenney wrote:
>>> On Thu, Dec 16, 2021 at 11:06:45PM +0900, Akira Yokosawa wrote:
>>>> On Thu, 16 Dec 2021 16:59:13 +0900, Akira Yokosawa wrote:
>>>>> Some of texts in the figure are lost when rendered by Inkscape
>>>>> 1.1.1 on Fedora 35.
>>>>> Those texts are placed far left from the viewBox of the figure
>>>>> when opened in Inkscape 1.1.1.
>>>>>
>>>>> This issue is similar to the one resolved by commit 36b07176210d
>>>>> ("defer: Make RCUspacetime.svg compatible with Inkscape 1.0 and
>>>>> later").
>>>>>
>>>>> Ungroup and adjust x-coordinates of those texts by Inkscape 1.1.1.
>>>>>
>>>>> Resulting SVG is compatible with Inkscape 0.92.x on Ubuntu 18.04
>>>>> and Ubuntu 20.04 as well as Inkscape >=1.0.
>>>>
>>>> Well, Firefox still has trouble with this.... (much better, but
>>>> still)
>>>>
>>>> Paul, please wait for v2.
>>>
>>> Idiot here forgot to do the inkscape editing on his Fedora system,
>>> apologies!
>>>
>>> Let me try that.
>>>
>>
>> I'm seeing the refined SVG in Firefox, and it still lacks some of
>> texts.
>>
>> Now I'm opening the SVG in a text editor...
>>
>> Oh, there actually are a dozen of "transform="rotate(90)"
>> and "transform="rotate(-90)" directives.
>> So you did rotate those texts, didn't you?
> 
> When I opened the diagram under Fedora, the text at the tops of many of
> the boxes was displaced to the left by a couple of page widths worth.
> 
> All I did was go into the top-level group, make like I was going to change
> the text of one of the affected text boxes, add a couple of rectangles,
> and then delete them.  The idea was to force inkscape to save the diagram.

I rolled back to the SVG when it first added to the Git repo,
commit 1524de6aaea0 ("defer: Add diagram of RCU use cases").

It already has those "transform=rotate(xxx)" directives and has
some texts lost in browsers.
Which suggests you did rotate those (grouped) texts before then.

It would be ideal to know what operation had caused such curruption.

> 
>> For perfbook, web-browser compatibility is not an issue,
>> but it might bite you when you reuse this figure in an
>> html page.
>>
>> And I've now noticed that RCUspacetime.svg is not rendered
>> right in Firefox, either.
>>
>> Let me see if there is a way to make them browser compatible.
> 
> I will pull in your patches and see what it looks like.  I had not
> considered it before, but I do agree that having a browser-compatible
> .svg is a very good thing, so thank you for checking up on this.
> 
> For my part, what I have done is to uninstall inkscape on the problematic
> system.  This should help prevent future instances of corruption.  :-/

But then you won't be able to build perfbook there.
Anyway, I'll keep an eye on the build on Ubuntu Focal.
Also, as was observed in the early days of Fedora 35, Inkscape might
stop working by an upgrade of any one of its dependencies.

An alternative might be installing an Inkscape's appimage, which is
available at https://inkscape.org/release/all/gnulinux/appimage/
, which contains all the (fairly old versions of) dependencies for
it to work.

I mentioned earlier that the snap package of Inkscape can not access
system-wide fonts.

The appimage flavor doesn't have such a restriction, as far as I
know.

On appimage, I think you can find a lot of tutorials.
For example, https://itsfoss.com/use-appimage-linux/

> 
> Again, thank you for checking up on this and debugging it!

You are welcome!

        Thanks, Akira

> 
>>> Ah, and I am expecting to do a release before the end of this year,
>>> preferably sooner.  This is not a big deal at all:  Release rather
>>> than edition!
>>
>> Nice!
>> I'll review new contents in rcuusage.tex this weekend.
> 
> Looking forward to it!
> 
> 							Thanx, Paul
> 
>>         Thanks, Akira
>>
>>
>>>
>>> 							Thanx, Paul
>>>
>>>>         Thanks, Akira
>>>>
>>>>>
>>>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>>>>> ---
>>>>> Hi Paul,
>>>>>
>>>>> So I said you are safe as far as you don't rotate texts.
>>>>> Apparently I was wrong!
>>>>>
>>>>> I'm suspecting the cause of the incompatibility is likely related to
>>>>> grouping of texts and doing some operation on the grouped text.
>>>>>
>>>>> In this retouch, I did ungrouping only.  So you might need to do
>>>>> proper grouping if you need further edit.
>>>>>
>>>>>         Thanks, Akira
>>>>> --
>>>>>  defer/RCUusecases.svg | 1406 +++++++++++++++++++----------------------
>>>>>  1 file changed, 656 insertions(+), 750 deletions(-)
>>>>>
>>>>> diff --git a/defer/RCUusecases.svg b/defer/RCUusecases.svg
>>>> [...]
