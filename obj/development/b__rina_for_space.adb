pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__rina_for_space.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__rina_for_space.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E082 : Short_Integer; pragma Import (Ada, E082, "system__os_lib_E");
   E009 : Short_Integer; pragma Import (Ada, E009, "ada__exceptions_E");
   E014 : Short_Integer; pragma Import (Ada, E014, "system__soft_links_E");
   E026 : Short_Integer; pragma Import (Ada, E026, "system__exception_table_E");
   E049 : Short_Integer; pragma Import (Ada, E049, "ada__containers_E");
   E077 : Short_Integer; pragma Import (Ada, E077, "ada__io_exceptions_E");
   E033 : Short_Integer; pragma Import (Ada, E033, "ada__numerics_E");
   E064 : Short_Integer; pragma Import (Ada, E064, "ada__strings_E");
   E066 : Short_Integer; pragma Import (Ada, E066, "ada__strings__maps_E");
   E069 : Short_Integer; pragma Import (Ada, E069, "ada__strings__maps__constants_E");
   E054 : Short_Integer; pragma Import (Ada, E054, "interfaces__c_E");
   E027 : Short_Integer; pragma Import (Ada, E027, "system__exceptions_E");
   E091 : Short_Integer; pragma Import (Ada, E091, "system__object_reader_E");
   E059 : Short_Integer; pragma Import (Ada, E059, "system__dwarf_lines_E");
   E022 : Short_Integer; pragma Import (Ada, E022, "system__soft_links__initialize_E");
   E048 : Short_Integer; pragma Import (Ada, E048, "system__traceback__symbolic_E");
   E032 : Short_Integer; pragma Import (Ada, E032, "system__img_int_E");
   E072 : Short_Integer; pragma Import (Ada, E072, "system__img_uns_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (Ada, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;
   pragma Favor_Top_Level (No_Param_Proc);

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Exception_Tracebacks : Integer;
      pragma Import (C, Exception_Tracebacks, "__gl_exception_tracebacks");
      Exception_Tracebacks_Symbolic : Integer;
      pragma Import (C, Exception_Tracebacks_Symbolic, "__gl_exception_tracebacks_symbolic");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := '8';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Exception_Tracebacks := 1;
      Exception_Tracebacks_Symbolic := 1;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      Finalize_Library_Objects := null;

      Ada.Exceptions'Elab_Spec;
      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E026 := E026 + 1;
      Ada.Containers'Elab_Spec;
      E049 := E049 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E077 := E077 + 1;
      Ada.Numerics'Elab_Spec;
      E033 := E033 + 1;
      Ada.Strings'Elab_Spec;
      E064 := E064 + 1;
      Ada.Strings.Maps'Elab_Spec;
      E066 := E066 + 1;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E069 := E069 + 1;
      Interfaces.C'Elab_Spec;
      E054 := E054 + 1;
      System.Exceptions'Elab_Spec;
      E027 := E027 + 1;
      System.Object_Reader'Elab_Spec;
      E091 := E091 + 1;
      System.Dwarf_Lines'Elab_Spec;
      System.Os_Lib'Elab_Body;
      E082 := E082 + 1;
      System.Soft_Links.Initialize'Elab_Body;
      E022 := E022 + 1;
      E014 := E014 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E048 := E048 + 1;
      System.Img_Int'Elab_Spec;
      E032 := E032 + 1;
      E009 := E009 + 1;
      System.Img_Uns'Elab_Spec;
      E072 := E072 + 1;
      E059 := E059 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_rina_for_space");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      if gnat_argc = 0 then
         gnat_argc := argc;
         gnat_argv := argv;
      end if;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   /home/henley/Desktop/GAP_org/RINA-for-Space/obj/development/rina.o
   --   /home/henley/Desktop/GAP_org/RINA-for-Space/obj/development/rina_for_space.o
   --   -L/home/henley/Desktop/GAP_org/RINA-for-Space/obj/development/
   --   -L/home/henley/Desktop/GAP_org/RINA-for-Space/obj/development/
   --   -L/home/henley/.local/share/alire/toolchains/gnat_native_13.2.2_a27fd794/lib/gcc/x86_64-pc-linux-gnu/13.2.0/adalib/
   --   -static
   --   -lgnat
   --   -ldl
--  END Object file/option list   

end ada_main;
