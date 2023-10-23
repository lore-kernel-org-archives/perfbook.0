Return-Path: <SRS0=LpL4=GF=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698072064; x=1698676864; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uRFu75VKun+o8HihnX4vilOZ9dEEULFohXloeC184Fk=;
        b=L3Vvm8RPBY1kbjWU5c9OtfItBuxUCIpchEYmQOjKoc+CV52+JVubLi4Gds2yBgmkwf
         RvBX7FFvgrenzea4jIybxk+HEyteOl6rUOYe4BlWCEEH8W/wGw/TD7I039liJ35/q4ep
         074bOD00MfHoeJufjljhI33Zn6tmPYfb0Vj6PUTPQ2kz8UcGNE0vQIH0R4YqzjejZkMg
         Vp1NET7y+odaG2RJyWYV1ggx5XwVPHG6hKNICLMSAvmv7RNp8zLhxc4G0HiZft6Er5ed
         cQ5CuuItzO4EpoNZrhgG83R+KxT6JaklEMkgyR/Fs4xFUd3WV9wdLkdQ7GARsxpVvXPC
         yYqQ==
Message-ID: <6369628a-49bb-476e-ba7c-ca5fadcddd49@gmail.com>
Date: Mon, 23 Oct 2023 23:41:01 +0900
MIME-Version: 1.0
Subject: Re: [PATCH -perfbook] Prevent inkscape from interacting with desktop
 manager
Content-Language: en-US
References: <f3621f4d-17b8-4c36-8d92-f8f031fe1281@gmail.com>
 <071a156b-a8c3-4665-9e78-359b9f421edc@paulmck-laptop>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <071a156b-a8c3-4665-9e78-359b9f421edc@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2023/10/21 2:37, Paul E. McKenney wrote:
> On Fri, Oct 20, 2023 at 06:29:32PM +0900, Akira Yokosawa wrote:
>> Crashes of command-line Inkscape happens when it exits too soon
>> before it can be properly removed from window manager's list of
>> applications it is aware of.
>> Glib 2.75.3 has removed GSlice allocator [1], which was permissive
>> about UAF issues.
>>
>> Question is, "why is the command-line Inkscape registered in
>> such a list in the first place?"
>>
>> There is mention of an option named "--without-gui" in Inkscape's
>> wiki page on "Using the Command Line" [2]:
>>
>>     The --without-gui option has been removed. Most parameters
>>     trigger Inkscape to run without GUI by default now. Instead
>>     enable GUI mode specifically using --with-gui if needed.
>>
>> However, current Inkscape does *initialize* itself as a GUI
>> application regardless of the need of GUI.
>>
>> Alternatively, Inkscape can be forced to run isolated from window/
>> desktop managers with bogus strings set to a couple of env variables.
>>
>> After some tries and errors, these two env variables turned out
>> to be essential here:
>>
>>     - XDG_RUNTIME_DIR
>>     - DBUS_SESSION_BUS_ADDRESS
>>
>> Update Makefile and set bogus strings to them, which sounds a little
>> rough but should be better than ignoring error codes, after reverting
>> commits:
>>
>>     - c2f9a99366b3 ("Ignore error of unstable Inkscape")
>>     - a01629a5f734 ("Make sure all PDF conversions are complete")
>>
>> This change resolves crashes of Inkscape observed under Fedora 38,
>> Fedora 39 beta, Ubuntu 23.04, and openSUSE tumbleweed.
>>
>> [1]: https://gitlab.gnome.org/GNOME/glib/-/issues/1079
>> [2]: https://wiki.inkscape.org/wiki/index.php/Using_the_Command_Line
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> 
> This issue is a bit annoying, isn't it?

Yea.

And it looks like debian's GNOME maintainers are eager enough and have
backported upstream GTK+3's fix mentioned in Inkscape's issue #4117 [3]
into its libgtk-3-0-3.24.38-5 [4].

In the fixes listed in [4], you see:

     - d/p/GtkApplicationImplDBus-Cancel-DBus-method-calls-on-shutdo.patch
       Fix a use-after-free crash during application quit, particularly
       affecting Inkscape command-line export with GLib >= 2.76, by
       cancelling processing of pending D-Bus calls (Closes: #1051220)

Ubuntu 23.10's libgtk-3-0-3.24.38-5ubuntu1 also has the fix.

This explains why debian testing and Ubuntu 23.10 is free of this
crashing issue.

Other affected distro users need to wait some more, I guess ...

[3]: https://gitlab.com/inkscape/inkscape/-/issues/4177#note_1464888693
[4]: https://tracker.debian.org/news/1461984/accepted-gtk30-32438-5-source-into-unstable/

        Thanks, Akira

[...]
