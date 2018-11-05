Multiedit |version|
===================

I created this plugin out of frustration that the ``:tabedit`` command
can only receive one argument and has no support for file patterns.
This plugin allows you to open multiple files with one command and
supports file patterns and Vim's file command completion.

Configuration
-------------

``g:multiedit_command``
^^^^^^^^^^^^^^^^^^^^^^^

You can define a custom name for the command. For example:

.. code-block:: vim

   let g:multiedit_command = 'M'

Default: ``Multiedit``

``g:multiedit_glob``
^^^^^^^^^^^^^^^^^^^^

| Multiedit will use ``glob()`` to parse given arguments.
| Set this variable to ``0`` to disable this behaviour.

Default: ``1``

Commands
--------

``:Multiedit[!] [file] ...``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

| Edit each given ``file`` in a new tab. Without arguments, open an empty tab.
| Will report glob pattern errors, use with ``!`` to ignore them.

License
-------

`Poetic License <LICENSE>`_

.. |version| image:: https://img.shields.io/badge/version-0.0.1-green.svg
